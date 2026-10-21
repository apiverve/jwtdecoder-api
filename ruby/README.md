# JWT Decoder API - Ruby Gem

JWT Decoder decodes JWT tokens to reveal header and payload information without performing signature verification. It handles JSON web token decode from any language over REST, so you can inspect claims and expiry without adding a JWT library.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_jwtdecoder'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_jwtdecoder
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_jwtdecoder'

# Initialize the client
client = APIVerve::Jwtdecoder::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({ token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c" })

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c" })
  puts response["data"]
rescue APIVerve::Jwtdecoder::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Jwtdecoder::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Jwtdecoder::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "header": {
      "alg": "HS256",
      "typ": "JWT"
    },
    "payload": {
      "sub": "1234567890",
      "name": "John Doe",
      "iat": 1516239022
    },
    "signature": "SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c",
    "isExpired": false,
    "expiresAt": null,
    "issuedAt": "2018-01-18T01:30:22.000Z",
    "tokenAge": "2557 days",
    "algorithm": "HS256",
    "expiresIn": null,
    "notYetValid": false,
    "securityAnalysis": {
      "isUnsecured": false,
      "hasExpiration": false,
      "isLongLived": false,
      "issues": [
        "Token has no expiration (exp) claim — it never expires"
      ]
    },
    "warning": "This API only decodes JWT tokens. It does NOT verify signatures. Do not use for security validation."
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/jwtdecoder?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/jwtdecoder?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/jwtdecoder?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
