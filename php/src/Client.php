<?php

declare(strict_types=1);

namespace APIVerve\Jwtdecoder;

use GuzzleHttp\Client as HttpClient;
use GuzzleHttp\Exception\GuzzleException;
use APIVerve\Jwtdecoder\Exceptions\APIException;
use APIVerve\Jwtdecoder\Exceptions\ValidationException;

/**
 * Client for the JWT Decoder API
 *
 * @example Basic usage
 * ```php
 * $client = new Client('your_api_key');
 * $response = $client->execute(['token' => 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InNhbXBsZS1rZXktMSJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaXNzIjoiaHR0cHM6Ly9hdXRoLmV4YW1wbGUuY29tIiwiYXVkIjoiYXBpLmV4YW1wbGUuY29tIiwiaWF0IjoxNzY3MjI1NjAwLCJleHAiOjIwODI3NTg0MDB9.hP0O9ELZGk-KN3upyYqdOnPY2Ig7FAzfUY_xytzOCBIhn0_TWdzl2dbLPlj0rkCDsRIQX0I5t9Xv551VI1W9dmvRGtVztyeD3IKHnIn24baOUtjU7Eb6FHL_iWMu5PqMeQJPFytuYbYhzjjCNfFPgAciGgn1Celr8H7_q51x5naMb-nbTvBc5SIX9MBnegGzabExBYQ-OsdKOoYmK0uymNIgC3834jlPuhuJHkPsxX7ncKoSQ4wheiLaZDwFANlT1NrD2XgKyyh-LIIg9CRwqB_WDktZ_R6UusNkLRhKJ20ff29ttkyRhJZzEqRRK60xYn7iPyg4YQni1J_w-oAa_w', 'publicKey' => '-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA9MiLgWPmLJoEIpAUHVvx
Gyo9vyW9/ryejQyuDZr1m5x0qj5y1otdjN3TwLH1PBQuinSDGiL7O56dfXwy/YIa
KOhANcJWe78eSDs4oMh3wQnzRfseWZfFgbLHU/nWyXjPE5WRa9F+H5A96KvmatER
G+kfWUINKR0RUTzox9xSy1KmiaQ5a2GoH3vINioVWBN1zX7Uq6mjCF5nYUMfWDyv
uUofPWRU2saYdxD2TtVlIs8F62IQU0bnMifFXqmZ5CkmXwPAFJXAIi38Lh/vkOvw
5B8oeiZd8ZEOLhSYlmhje1IGIwlB8B/ekKnZp4BdKsJYgGka7yn9NTuRsx8U7tfr
7QIDAQAB
-----END PUBLIC KEY-----']);
 * print_r($response);
 * ```
 *
 * @see https://apiverve.com/marketplace/jwtdecoder?utm_source=php&utm_medium=referral&utm_content=readme
 */
class Client
{
    private const BASE_URL = 'https://api.apiverve.com/v1/jwtdecoder';
    private const DEFAULT_TIMEOUT = 30;

    private string $apiKey;
    private HttpClient $httpClient;
    private bool $debug;

    /**
     * Validation rules for parameters
     */
    private const VALIDATION_RULES = [
        'token' => ['type' => 'string', 'required' => true],
        'publicKey' => ['type' => 'string', 'required' => false]
    ];

    /**
     * Format validation patterns
     */
    private const FORMAT_PATTERNS = [
        'email' => '/^[^\s@]+@[^\s@]+\.[^\s@]+$/',
        'url' => '/^https?:\/\/.+/',
        'ip' => '/^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$/',
        'date' => '/^\d{4}-\d{2}-\d{2}$/',
        'hexColor' => '/^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$/'
    ];

    /**
     * Initialize the client
     *
     * @param string $apiKey Your APIVerve API key
     * @param int $timeout Request timeout in seconds (default: 30)
     * @param bool $debug Enable debug logging (default: false)
     * @throws \InvalidArgumentException If API key is invalid
     */
    public function __construct(string $apiKey, int $timeout = self::DEFAULT_TIMEOUT, bool $debug = false)
    {
        $this->validateApiKey($apiKey);

        $this->apiKey = $apiKey;
        $this->debug = $debug;

        $this->httpClient = new HttpClient([
            'base_uri' => self::BASE_URL,
            'timeout' => $timeout,
            'headers' => [
                'x-api-key' => $this->apiKey,
                'auth-mode' => 'packagist-package',
                'Content-Type' => 'application/json'
            ]
        ]);
    }

    /**
     * Execute the API request
     *
     * @param array $params Query parameters or request body
     * @return array API response
     * @throws APIException If the request fails
     * @throws ValidationException If parameter validation fails
     */
    public function execute(array $params = []): array
    {
        $this->validateParams($params);

        $this->log("Making POST request to " . self::BASE_URL);
        if (!empty($params)) {
            $this->log("Parameters: " . json_encode($params));
        }

        try {
            $response = $this->httpClient->post('', [
                'json' => $params
            ]);

            return $this->handleResponse($response);
        } catch (GuzzleException $e) {
            throw new APIException("Request failed: " . $e->getMessage(), $e->getCode());
        }
    }


    /**
     * Validate the API key format
     *
     * @param string $apiKey
     * @throws \InvalidArgumentException If API key is invalid
     */
    private function validateApiKey(string $apiKey): void
    {
        if (empty(trim($apiKey))) {
            throw new \InvalidArgumentException(
                "API key is required. Get your API key at: https://apiverve.com"
            );
        }

        if (!preg_match('/^[a-zA-Z0-9_-]+$/', $apiKey)) {
            throw new \InvalidArgumentException(
                "Invalid API key format. API key should only contain letters, numbers, hyphens, and underscores."
            );
        }
    }

    /**
     * Validate parameters against schema rules
     *
     * @param array $params
     * @throws ValidationException If validation fails
     */
    private function validateParams(array $params): void
    {
        if (empty(self::VALIDATION_RULES)) {
            return;
        }

        $errors = [];

        foreach (self::VALIDATION_RULES as $paramName => $rules) {
            $value = $params[$paramName] ?? null;

            // Check required
            if (($rules['required'] ?? false) && ($value === null || $value === '')) {
                $errors[] = "Required parameter [{$paramName}] is missing.";
                continue;
            }

            if ($value === null) {
                continue;
            }

            $type = $rules['type'] ?? 'string';

            // Type validation
            switch ($type) {
                case 'integer':
                case 'number':
                    if (!is_numeric($value)) {
                        $errors[] = "Parameter [{$paramName}] must be a valid {$type}.";
                        continue 2;
                    }
                    $numValue = $type === 'number' ? (float)$value : (int)$value;
                    if (isset($rules['min']) && $numValue < $rules['min']) {
                        $errors[] = "Parameter [{$paramName}] must be at least {$rules['min']}.";
                    }
                    if (isset($rules['max']) && $numValue > $rules['max']) {
                        $errors[] = "Parameter [{$paramName}] must be at most {$rules['max']}.";
                    }
                    break;

                case 'string':
                    if (!is_string($value)) {
                        $errors[] = "Parameter [{$paramName}] must be a string.";
                        continue 2;
                    }
                    if (isset($rules['minLength']) && strlen($value) < $rules['minLength']) {
                        $errors[] = "Parameter [{$paramName}] must be at least {$rules['minLength']} characters.";
                    }
                    if (isset($rules['maxLength']) && strlen($value) > $rules['maxLength']) {
                        $errors[] = "Parameter [{$paramName}] must be at most {$rules['maxLength']} characters.";
                    }
                    if (isset($rules['format']) && isset(self::FORMAT_PATTERNS[$rules['format']])) {
                        if (!preg_match(self::FORMAT_PATTERNS[$rules['format']], $value)) {
                            $errors[] = "Parameter [{$paramName}] must be a valid {$rules['format']}.";
                        }
                    }
                    break;

                case 'boolean':
                    if (!is_bool($value) && !in_array($value, ['true', 'false', '0', '1'], true)) {
                        $errors[] = "Parameter [{$paramName}] must be a boolean.";
                    }
                    break;
            }

            // Enum validation
            if (isset($rules['enum']) && !in_array($value, $rules['enum'], true)) {
                $errors[] = "Parameter [{$paramName}] must be one of: " . implode(', ', $rules['enum']) . ".";
            }
        }

        if (!empty($errors)) {
            throw new ValidationException($errors);
        }
    }

    /**
     * Handle the API response
     *
     * @param \Psr\Http\Message\ResponseInterface $response
     * @return array
     * @throws APIException If the response indicates an error
     */
    private function handleResponse($response): array
    {
        $statusCode = $response->getStatusCode();
        $body = (string)$response->getBody();

        $this->log("Response status: {$statusCode}");

        try {
            $data = json_decode($body, true, 512, JSON_THROW_ON_ERROR);
        } catch (\JsonException $e) {
            throw new APIException("Invalid JSON response: " . $e->getMessage(), $statusCode);
        }

        if (($data['status'] ?? '') === 'error') {
            throw new APIException($data['error'] ?? 'Unknown API error', $statusCode, $data);
        }

        if ($statusCode >= 400) {
            throw new APIException($data['error'] ?? "HTTP {$statusCode} error", $statusCode, $data);
        }

        $this->log("Request successful");
        return $data;
    }

    /**
     * Log a debug message
     *
     * @param string $message
     */
    private function log(string $message): void
    {
        if ($this->debug) {
            echo "[APIVerve\JwtdecoderClient] {$message}\n";
        }
    }
}
