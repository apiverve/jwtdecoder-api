# JWT Decoder API - PHP Package

JWT Decoder decodes JWT tokens to reveal header and payload information without performing signature verification.

## Installation

Install via Composer:

```bash
composer require apiverve/jwtdecoder
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Jwtdecoder\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute(['token' => 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c']);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Jwtdecoder\Client;
use APIVerve\Jwtdecoder\Exceptions\APIException;
use APIVerve\Jwtdecoder\Exceptions\ValidationException;

try {
    $response = $client->execute(['token' => 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/jwtdecoder?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/jwtdecoder?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/jwtdecoder?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
