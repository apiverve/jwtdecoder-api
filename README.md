# [JWT Decoder API](https://apiverve.com/marketplace/jwtdecoder?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)

JWT Decoder decodes JWT tokens to reveal header and payload information, and on paid plans verifies the signature against a public key you supply. It handles JSON web token decode from any language over REST, so you can inspect claims and expiry without adding a JWT library.

The JWT Decoder API provides a simple, reliable way to integrate jwt decoder functionality into your applications. Built for developers who need production-ready jwt decoder capabilities without the complexity of building from scratch.

**[View API Details →](https://apiverve.com/marketplace/jwtdecoder?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![API Status](https://img.shields.io/badge/Status-Active-green.svg)](https://apiverve.com/marketplace/jwtdecoder?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
[![Method](https://img.shields.io/badge/Method-POST-blue.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-Multi--Platform-orange.svg)](#installation)

**Available on:**
[![npm](https://img.shields.io/badge/npm-CB3837?style=flat&logo=npm&logoColor=white)](https://www.npmjs.com/package/@apiverve/jwtdecoder)
[![NuGet](https://img.shields.io/badge/NuGet-004880?style=flat&logo=nuget&logoColor=white)](https://www.nuget.org/packages/APIVerve.API.JWTDecoder)
[![PyPI](https://img.shields.io/badge/PyPI-3776AB?style=flat&logo=python&logoColor=white)](https://pypi.org/project/apiverve-jwtdecoder/)
[![RubyGems](https://img.shields.io/badge/RubyGems-E9573F?style=flat&logo=rubygems&logoColor=white)](https://rubygems.org/gems/apiverve_jwtdecoder)
[![Packagist](https://img.shields.io/badge/Packagist-F28D1A?style=flat&logo=packagist&logoColor=white)](https://packagist.org/packages/apiverve/jwtdecoder)
[![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go&logoColor=white)](#-go)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)](https://pub.dev/packages/apiverve_jwtdecoder)
[![JitPack](https://img.shields.io/badge/JitPack-2E7D32?style=flat&logo=android&logoColor=white)](#-android-jitpack)

---

## Quick Start

### Using JavaScript

```javascript
async function callJWTDecoderAPI() {
    try {
        const requestBody = {
    "token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InNhbXBsZS1rZXktMSJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaXNzIjoiaHR0cHM6Ly9hdXRoLmV4YW1wbGUuY29tIiwiYXVkIjoiYXBpLmV4YW1wbGUuY29tIiwiaWF0IjoxNzY3MjI1NjAwLCJleHAiOjIwODI3NTg0MDB9.hP0O9ELZGk-KN3upyYqdOnPY2Ig7FAzfUY_xytzOCBIhn0_TWdzl2dbLPlj0rkCDsRIQX0I5t9Xv551VI1W9dmvRGtVztyeD3IKHnIn24baOUtjU7Eb6FHL_iWMu5PqMeQJPFytuYbYhzjjCNfFPgAciGgn1Celr8H7_q51x5naMb-nbTvBc5SIX9MBnegGzabExBYQ-OsdKOoYmK0uymNIgC3834jlPuhuJHkPsxX7ncKoSQ4wheiLaZDwFANlT1NrD2XgKyyh-LIIg9CRwqB_WDktZ_R6UusNkLRhKJ20ff29ttkyRhJZzEqRRK60xYn7iPyg4YQni1J_w-oAa_w",
    "publicKey": "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA9MiLgWPmLJoEIpAUHVvx\nGyo9vyW9/ryejQyuDZr1m5x0qj5y1otdjN3TwLH1PBQuinSDGiL7O56dfXwy/YIa\nKOhANcJWe78eSDs4oMh3wQnzRfseWZfFgbLHU/nWyXjPE5WRa9F+H5A96KvmatER\nG+kfWUINKR0RUTzox9xSy1KmiaQ5a2GoH3vINioVWBN1zX7Uq6mjCF5nYUMfWDyv\nuUofPWRU2saYdxD2TtVlIs8F62IQU0bnMifFXqmZ5CkmXwPAFJXAIi38Lh/vkOvw\n5B8oeiZd8ZEOLhSYlmhje1IGIwlB8B/ekKnZp4BdKsJYgGka7yn9NTuRsx8U7tfr\n7QIDAQAB\n-----END PUBLIC KEY-----"
};

        const response = await fetch('https://api.apiverve.com/v1/jwtdecoder', {
            method: 'POST',
            headers: {
                'x-api-key': 'YOUR_API_KEY_HERE',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestBody)
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Error:', error);
    }
}

callJWTDecoderAPI();
```

### Using cURL

```bash
curl -X POST "https://api.apiverve.com/v1/jwtdecoder" \
  -H "x-api-key: YOUR_API_KEY_HERE" \
  -H "Content-Type: application/json" \
  -d '{
    "token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InNhbXBsZS1rZXktMSJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaXNzIjoiaHR0cHM6Ly9hdXRoLmV4YW1wbGUuY29tIiwiYXVkIjoiYXBpLmV4YW1wbGUuY29tIiwiaWF0IjoxNzY3MjI1NjAwLCJleHAiOjIwODI3NTg0MDB9.hP0O9ELZGk-KN3upyYqdOnPY2Ig7FAzfUY_xytzOCBIhn0_TWdzl2dbLPlj0rkCDsRIQX0I5t9Xv551VI1W9dmvRGtVztyeD3IKHnIn24baOUtjU7Eb6FHL_iWMu5PqMeQJPFytuYbYhzjjCNfFPgAciGgn1Celr8H7_q51x5naMb-nbTvBc5SIX9MBnegGzabExBYQ-OsdKOoYmK0uymNIgC3834jlPuhuJHkPsxX7ncKoSQ4wheiLaZDwFANlT1NrD2XgKyyh-LIIg9CRwqB_WDktZ_R6UusNkLRhKJ20ff29ttkyRhJZzEqRRK60xYn7iPyg4YQni1J_w-oAa_w",
    "publicKey": "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA9MiLgWPmLJoEIpAUHVvx\nGyo9vyW9/ryejQyuDZr1m5x0qj5y1otdjN3TwLH1PBQuinSDGiL7O56dfXwy/YIa\nKOhANcJWe78eSDs4oMh3wQnzRfseWZfFgbLHU/nWyXjPE5WRa9F+H5A96KvmatER\nG+kfWUINKR0RUTzox9xSy1KmiaQ5a2GoH3vINioVWBN1zX7Uq6mjCF5nYUMfWDyv\nuUofPWRU2saYdxD2TtVlIs8F62IQU0bnMifFXqmZ5CkmXwPAFJXAIi38Lh/vkOvw\n5B8oeiZd8ZEOLhSYlmhje1IGIwlB8B/ekKnZp4BdKsJYgGka7yn9NTuRsx8U7tfr\n7QIDAQAB\n-----END PUBLIC KEY-----"
}'
```

**Get your API key:** [https://apiverve.com](https://apiverve.com)

**📁 For more examples, see the [examples folder](./examples/)**

---

## Installation

Choose your preferred programming language:

### 📦 NPM (JavaScript/Node.js)

```bash
npm install @apiverve/jwtdecoder
```

[**View NPM Package →**](https://www.npmjs.com/package/@apiverve/jwtdecoder) | [**Package Code →**](./npm/)

---

### 🔷 NuGet (.NET/C#)

```bash
dotnet add package APIVerve.API.JWTDecoder
```

[**View NuGet Package →**](https://www.nuget.org/packages/APIVerve.API.JWTDecoder) | [**Package Code →**](./nuget/)

---

### 🐍 Python (PyPI)

```bash
pip install apiverve-jwtdecoder
```

[**View PyPI Package →**](https://pypi.org/project/apiverve-jwtdecoder/) | [**Package Code →**](./python/)

---

### 💎 Ruby (RubyGems)

```bash
gem install apiverve_jwtdecoder
```

[**View RubyGems Package →**](https://rubygems.org/gems/apiverve_jwtdecoder) | [**Package Code →**](./ruby/)

---

### 🐘 PHP (Packagist)

```bash
composer require apiverve/jwtdecoder
```

[**View Packagist Package →**](https://packagist.org/packages/apiverve/jwtdecoder) | [**Package Code →**](./php/)

---

### 🎯 Dart (pub.dev)

```bash
dart pub add apiverve_jwtdecoder
```

[**View pub.dev Package →**](https://pub.dev/packages/apiverve_jwtdecoder) | [**Package Code →**](./dart/)

---

### 🤖 Android (JitPack)

```gradle
implementation 'com.github.apiverve:jwtdecoder-api:1.0.0'
```

[**Package Code →**](./android/)

---

### 🐹 Go

```bash
go get github.com/apiverve/jwtdecoder-api/go
```

[**Package Code →**](./go/)

---

## Why Use This API?

| Feature | Benefit |
|---------|---------|
| **Multi-language SDKs** | Native packages for JavaScript, Python, C#, Go, and Android |
| **Simple Integration** | Single API key authentication, consistent response format |
| **Production Ready** | 99.9% uptime SLA, served from 24 global regions |
| **Comprehensive Docs** | Full examples, OpenAPI spec, and dedicated support |

---

## Documentation

- 🏠 **API Home:** [JWT Decoder API](https://apiverve.com/marketplace/jwtdecoder?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 📚 **API Reference:** [docs.apiverve.com/ref/jwtdecoder](https://docs.apiverve.com/ref/jwtdecoder)
- 📖 **OpenAPI Spec:** [openapi.yaml](./openapi.yaml)
- 💡 **Examples:** [examples/](./examples/)

---

## What Can You Build?

The JWT Decoder API is commonly used for:

- **Web Applications** - Add jwt decoder features to your frontend or backend
- **Mobile Apps** - Native SDKs for Android development
- **Automation** - Integrate with n8n, Zapier, or custom workflows
- **SaaS Products** - Enhance your product with jwt decoder capabilities
- **Data Pipelines** - Process and analyze data at scale

---

## API Reference

### Authentication
All requests require an API key in the header:
```
x-api-key: YOUR_API_KEY_HERE
```

Get your API key: [https://apiverve.com](https://apiverve.com)

### Response Format

Every APIVerve endpoint returns the same envelope — check `status`, then read `data`:

```json
{
  "status": "ok",
  "error": null,
  "data": { ... }
}
```

### Example Response

A real response from the JWT Decoder API:

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "header": {
      "alg": "RS256",
      "typ": "JWT",
      "kid": "sample-key-1"
    },
    "payload": {
      "sub": "1234567890",
      "name": "John Doe",
      "iss": "https://auth.example.com",
      "aud": "api.example.com",
      "iat": 1767225600,
      "exp": 2082758400
    },
    "signature": "hP0O9ELZGk-KN3upyYqdOnPY2Ig7FAzfUY_xytzOCBIhn0_TWdzl2dbLPlj0rkCDsRIQX0I5t9Xv551VI1W9dmvRGtVztyeD3IKHnIn24baOUtjU7Eb6FHL_iWMu5PqMeQJPFytuYbYhzjjCNfFPgAciGgn1Celr8H7_q51x5naMb-nbTvBc5SIX9MBnegGzabExBYQ-OsdKOoYmK0uymNIgC3834jlPuhuJHkPsxX7ncKoSQ4wheiLaZDwFANlT1NrD2XgKyyh-LIIg9CRwqB_WDktZ_R6UusNkLRhKJ20ff29ttkyRhJZzEqRRK60xYn7iPyg4YQni1J_w-oAa_w",
    "isExpired": false,
    "expiresAt": "2036-01-01T00:00:00.000Z",
    "issuedAt": "2026-01-01T00:00:00.000Z",
    "tokenAge": "309 days",
    "algorithm": "RS256",
    "expiresIn": 288757380,
    "notYetValid": false,
    "securityAnalysis": {
      "isUnsecured": false,
      "hasExpiration": true,
      "isLongLived": true,
      "issues": [
        "Token lifetime exceeds 24 hours"
      ]
    },
    "warning": "Signature verified with the supplied public key.",
    "signatureVerification": {
      "verified": true,
      "algorithm": "RS256",
      "keyType": "RSA",
      "reason": null,
      "claimsValid": true,
      "claimsReason": null
    }
  }
}
```

---

## Support & Community

- 🏠 **API Home**: [JWT Decoder API](https://apiverve.com/marketplace/jwtdecoder?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 💬 **Support**: [https://apiverve.com/contact](https://apiverve.com/contact)
- 🐛 **Issues**: [GitHub Issues](../../issues)
- 📖 **Documentation**: [https://docs.apiverve.com](https://docs.apiverve.com)
- 🌐 **Website**: [https://apiverve.com](https://apiverve.com)

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Security

For security concerns, please review our [Security Policy](SECURITY.md).

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

Built with ❤️ by [APIVerve](https://apiverve.com)

Copyright © 2026 APIVerve. All rights reserved.
