/**
 * JWT Decoder API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the JWT Decoder API.
 * API Documentation: https://docs.apiverve.com/ref/jwtdecoder
 */

const API_KEY = process.env.APIVERVE_API_KEY || 'YOUR_API_KEY_HERE';
const API_URL = 'https://api.apiverve.com/v1/jwtdecoder';

/**
 * Make a POST request to the JWT Decoder API
 */
async function callJWTDecoderAPI() {
  try {
    // Request body
    const requestBody &#x3D; {
    &quot;token&quot;: &quot;eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InNhbXBsZS1rZXktMSJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaXNzIjoiaHR0cHM6Ly9hdXRoLmV4YW1wbGUuY29tIiwiYXVkIjoiYXBpLmV4YW1wbGUuY29tIiwiaWF0IjoxNzY3MjI1NjAwLCJleHAiOjIwODI3NTg0MDB9.hP0O9ELZGk-KN3upyYqdOnPY2Ig7FAzfUY_xytzOCBIhn0_TWdzl2dbLPlj0rkCDsRIQX0I5t9Xv551VI1W9dmvRGtVztyeD3IKHnIn24baOUtjU7Eb6FHL_iWMu5PqMeQJPFytuYbYhzjjCNfFPgAciGgn1Celr8H7_q51x5naMb-nbTvBc5SIX9MBnegGzabExBYQ-OsdKOoYmK0uymNIgC3834jlPuhuJHkPsxX7ncKoSQ4wheiLaZDwFANlT1NrD2XgKyyh-LIIg9CRwqB_WDktZ_R6UusNkLRhKJ20ff29ttkyRhJZzEqRRK60xYn7iPyg4YQni1J_w-oAa_w&quot;,
    &quot;publicKey&quot;: &quot;-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA9MiLgWPmLJoEIpAUHVvx\nGyo9vyW9/ryejQyuDZr1m5x0qj5y1otdjN3TwLH1PBQuinSDGiL7O56dfXwy/YIa\nKOhANcJWe78eSDs4oMh3wQnzRfseWZfFgbLHU/nWyXjPE5WRa9F+H5A96KvmatER\nG+kfWUINKR0RUTzox9xSy1KmiaQ5a2GoH3vINioVWBN1zX7Uq6mjCF5nYUMfWDyv\nuUofPWRU2saYdxD2TtVlIs8F62IQU0bnMifFXqmZ5CkmXwPAFJXAIi38Lh/vkOvw\n5B8oeiZd8ZEOLhSYlmhje1IGIwlB8B/ekKnZp4BdKsJYgGka7yn9NTuRsx8U7tfr\n7QIDAQAB\n-----END PUBLIC KEY-----&quot;
};

    const response = await fetch(API_URL, {
      method: 'POST',
      headers: {
        'x-api-key': API_KEY,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(requestBody)
    });

    // Check if response is successful
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    // Check API response status
    if (data.status === 'ok') {
      console.log('✓ Success!');
      console.log('Response data:', data.data);
      return data.data;
    } else {
      console.error('✗ API Error:', data.error || 'Unknown error');
      return null;
    }

  } catch (error) {
    console.error('✗ Request failed:', error.message);
    return null;
  }
}

// Run the example
callJWTDecoderAPI()
  .then(result => {
    if (result) {
      console.log('\n📊 Final Result:');
      console.log(JSON.stringify(result, null, 2));
    }
  });
