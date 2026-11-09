# frozen_string_literal: true

require "faraday"
require "faraday/multipart"
require "json"

module APIVerve
  module Jwtdecoder
    # Client for the JWT Decoder API
    #
    # @example Basic usage
    #   client = APIVerve::Jwtdecoder::Client.new(api_key: "your_api_key")
    #   response = client.execute({ token: "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InNhbXBsZS1rZXktMSJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaXNzIjoiaHR0cHM6Ly9hdXRoLmV4YW1wbGUuY29tIiwiYXVkIjoiYXBpLmV4YW1wbGUuY29tIiwiaWF0IjoxNzY3MjI1NjAwLCJleHAiOjIwODI3NTg0MDB9.hP0O9ELZGk-KN3upyYqdOnPY2Ig7FAzfUY_xytzOCBIhn0_TWdzl2dbLPlj0rkCDsRIQX0I5t9Xv551VI1W9dmvRGtVztyeD3IKHnIn24baOUtjU7Eb6FHL_iWMu5PqMeQJPFytuYbYhzjjCNfFPgAciGgn1Celr8H7_q51x5naMb-nbTvBc5SIX9MBnegGzabExBYQ-OsdKOoYmK0uymNIgC3834jlPuhuJHkPsxX7ncKoSQ4wheiLaZDwFANlT1NrD2XgKyyh-LIIg9CRwqB_WDktZ_R6UusNkLRhKJ20ff29ttkyRhJZzEqRRK60xYn7iPyg4YQni1J_w-oAa_w", publicKey: "-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA9MiLgWPmLJoEIpAUHVvx
Gyo9vyW9/ryejQyuDZr1m5x0qj5y1otdjN3TwLH1PBQuinSDGiL7O56dfXwy/YIa
KOhANcJWe78eSDs4oMh3wQnzRfseWZfFgbLHU/nWyXjPE5WRa9F+H5A96KvmatER
G+kfWUINKR0RUTzox9xSy1KmiaQ5a2GoH3vINioVWBN1zX7Uq6mjCF5nYUMfWDyv
uUofPWRU2saYdxD2TtVlIs8F62IQU0bnMifFXqmZ5CkmXwPAFJXAIi38Lh/vkOvw
5B8oeiZd8ZEOLhSYlmhje1IGIwlB8B/ekKnZp4BdKsJYgGka7yn9NTuRsx8U7tfr
7QIDAQAB
-----END PUBLIC KEY-----" })
    #   puts response
    #
    # @see https://apiverve.com/marketplace/jwtdecoder?utm_source=ruby&utm_medium=referral&utm_content=readme
    class Client
      BASE_URL = "https://api.apiverve.com/v1/jwtdecoder"
      DEFAULT_TIMEOUT = 30

      # Validation rules for parameters
      VALIDATION_RULES = { 'token' => { type: 'string', required: true }, 'publicKey' => { type: 'string', required: false } }

      # Format validation patterns
      FORMAT_PATTERNS = {
        'email' => /^[^\s@]+@[^\s@]+\.[^\s@]+$/,
        'url' => /^https?:\/\/.+/,
        'ip' => /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$/,
        'date' => /^\d{4}-\d{2}-\d{2}$/,
        'hexColor' => /^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$/
      }.freeze

      # Initialize the client
      #
      # @param api_key [String] Your APIVerve API key
      # @param timeout [Integer] Request timeout in seconds (default: 30)
      # @param debug [Boolean] Enable debug logging (default: false)
      # @raise [ArgumentError] If API key is invalid
      def initialize(api_key:, timeout: DEFAULT_TIMEOUT, debug: false)
        validate_api_key!(api_key)

        @api_key = api_key
        @timeout = timeout
        @debug = debug

        @connection = Faraday.new(url: BASE_URL) do |conn|
          conn.request :multipart
          conn.request :url_encoded
          conn.adapter Faraday.default_adapter
          conn.options.timeout = @timeout
          conn.headers["x-api-key"] = @api_key
          conn.headers["auth-mode"] = "rubygems-package"
          conn.headers["Content-Type"] = "application/json"
        end
      end

      # Execute the API request
      #
      # @param params [Hash] Query parameters or request body
      # @return [Hash] API response
      # @raise [APIError] If the request fails
      # @raise [ValidationError] If parameter validation fails
      def execute(params = {})
        validate_params!(params)

        log("Making POST request to #{BASE_URL}")
        log("Parameters: #{params.inspect}") if params.any?

        response = @connection.post do |req|
          req.body = params.to_json
        end

        handle_response(response)
      end

      private

      def validate_api_key!(api_key)
        raise ArgumentError, "API key is required. Get your API key at: https://apiverve.com" if api_key.nil? || api_key.strip.empty?

        unless api_key.match?(/^[a-zA-Z0-9_-]+$/)
          raise ArgumentError, "Invalid API key format. API key should only contain letters, numbers, hyphens, and underscores."
        end
      end

      def validate_params!(params)
        return if VALIDATION_RULES.empty?

        errors = []

        VALIDATION_RULES.each do |param_name, rules|
          value = params[param_name.to_sym] || params[param_name]

          # Check required
          if rules[:required] && (value.nil? || value.to_s.empty?)
            errors << "Required parameter [#{param_name}] is missing."
            next
          end

          next if value.nil?

          case rules[:type]
          when "integer", "number"
            begin
              num_value = rules[:type] == "number" ? Float(value) : Integer(value)
              errors << "Parameter [#{param_name}] must be at least #{rules[:min]}." if rules[:min] && num_value < rules[:min]
              errors << "Parameter [#{param_name}] must be at most #{rules[:max]}." if rules[:max] && num_value > rules[:max]
            rescue ArgumentError, TypeError
              errors << "Parameter [#{param_name}] must be a valid #{rules[:type]}."
            end
          when "string"
            unless value.is_a?(String)
              errors << "Parameter [#{param_name}] must be a string."
              next
            end
            errors << "Parameter [#{param_name}] must be at least #{rules[:min_length]} characters." if rules[:min_length] && value.length < rules[:min_length]
            errors << "Parameter [#{param_name}] must be at most #{rules[:max_length]} characters." if rules[:max_length] && value.length > rules[:max_length]

            if rules[:format] && FORMAT_PATTERNS[rules[:format]]
              unless value.match?(FORMAT_PATTERNS[rules[:format]])
                errors << "Parameter [#{param_name}] must be a valid #{rules[:format]}."
              end
            end
          when "boolean"
            unless [true, false, "true", "false"].include?(value)
              errors << "Parameter [#{param_name}] must be a boolean."
            end
          end

          # Enum validation
          if rules[:enum] && !rules[:enum].include?(value)
            errors << "Parameter [#{param_name}] must be one of: #{rules[:enum].join(', ')}."
          end
        end

        raise ValidationError, errors unless errors.empty?
      end

      def handle_response(response)
        log("Response status: #{response.status}")

        data = JSON.parse(response.body)

        if data["status"] == "error"
          raise APIError.new(data["error"] || "Unknown API error", response.status, data)
        end

        unless response.success?
          raise APIError.new(data["error"] || "HTTP #{response.status} error", response.status, data)
        end

        log("Request successful")
        data
      rescue JSON::ParserError => e
        raise APIError.new("Invalid JSON response: #{e.message}", response.status)
      end

      def log(message)
        puts "[APIVerve::Jwtdecoder] #{message}" if @debug
      end
    end

    # Custom error class for API errors
    class APIError < StandardError
      attr_reader :status_code, :response

      def initialize(message, status_code = nil, response = nil)
        @status_code = status_code
        @response = response
        super(message)
      end
    end

    # Custom error class for validation errors
    class ValidationError < StandardError
      attr_reader :errors

      def initialize(errors)
        @errors = errors
        super("Validation failed: #{errors.join(' ')}")
      end
    end
  end
end
