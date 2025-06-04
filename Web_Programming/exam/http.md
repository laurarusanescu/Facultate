
# 🌐 HTTP Study Guide & Cheat Sheet

## 🧠 Key Concepts

- **HTTP** stands for HyperText Transfer Protocol
- It is the foundation of data communication for the World Wide Web
- Standardized by the IETF (RFC 2616)
- **Request–Response** protocol: a client (browser) sends a request, the server responds
- **Stateless**: does not keep session info between requests
- Runs on top of **TCP** (port 80 by default)
- Latest common version: **HTTP/1.1**

---

## 📄 HTML Forms & HTTP

- Forms allow users to input data, which is sent to the server using HTTP
- `<form>` attributes:
  - `action`: URL to send form data to
  - `method`: `get` (data in URL) or `post` (data in body)
  - `enctype`: how to encode form data (`application/x-www-form-urlencoded`, `multipart/form-data`, `text/plain`)
  - `accept-charset`: character sets server can handle
- `<input>` tag types: text, password, button, reset, submit, radio, checkbox, file, image, hidden

---

## ✍️ Input & Form Elements

- `<input>`: different `type` for different controls (text, password, button, etc.)
- `<textarea>`: multi-line text input
- `<button>`: clickable button (can contain HTML)
- `<select>` and `<option>`: drop-down menus
- `<optgroup>`: group related options in a menu
- `<fieldset>` and `<legend>`: group and label sets of fields
- `<label>`: labels for inputs, improves usability

---

## 🌍 URL and URI

- **URL (Uniform Resource Locator)**: identifies a resource's location on the web
  - Format: `scheme://domain:port/path?querystring#fragment`
  - Example: `https://www.example.com:443/index.html?search=test#section1`
- **URI (Uniform Resource Identifier)**: a string that identifies a resource (URLs are a type of URI)
- See the URI structure diagram on *page 13* of your slides

---

## 🔗 Web Communication

- **Browser (Client)** sends HTTP Request to Web Server
- **Server** sends HTTP Response back to Client
- See communication diagram on *page 14* of your slides

---

## 📬 HTTP Request

### Format:
```
Request-Method SP Request-URL SP HTTP-Version <CR><LF>
(headers...)
<CR><LF>
[message body]
```

### Common Methods:
- `GET`: Request a resource
- `POST`: Send data to server
- `PUT`: Store the enclosed entity
- `DELETE`: Delete the resource
- `HEAD`: Like GET but without response body
- `OPTIONS`, `TRACE`, `CONNECT`

### Common Request Headers:
- `Host`: Domain name of server
- `User-Agent`: Info about the browser
- `Accept`: Accepted MIME types
- `Accept-Charset`: Accepted charsets
- `Accept-Encoding`: Accepted encodings
- `Accept-Language`: Accepted languages
- `Authorization`: Credentials
- `Referer`: Referring page

---

## 📥 HTTP Response

### Format:
```
HTTP-Version SP Status-Code SP Reason-Phrase<CR><LF>
(headers...)
<CR><LF>
[message body]
```

### Common Response Headers:
- `Server`: Server software info
- `Content-Type`: MIME type of the response
- `Content-Length`: Size in bytes
- `Cache-Control`: Caching directives
- `Location`: Redirect URL
- `Set-Cookie`: Set cookies
- `Date`: Time of response
- `Expires`: When response is stale

---

## 📨 HTTP Example

### Example Request:
```
GET / HTTP/1.1
Host: www.google.com
User-Agent: Mozilla/5.0
Accept: text/html
Accept-Language: en-US
Accept-Encoding: gzip, deflate
Connection: keep-alive
```

### Example Response:
```
HTTP/1.1 200 OK
Date: Tue, 13 Oct 2009 05:27:42 GMT
Content-Type: text/html; charset=UTF-8
Content-Encoding: gzip
Server: gws
Content-Length: 3667
```

---

## 📝 Quick Tips

- Use `GET` for retrieving data, `POST` for sending data that changes the server (like submitting forms)
- **HTTP is stateless**; cookies or tokens are needed for sessions
- Form `method="post"` is more secure for sensitive data (data not shown in URL)
- Use browser dev tools (Network tab) to view HTTP requests and responses

---

## 📚 References

- Your lecture slides: "HTTP - HyperText Transfer Protocol.pdf"
- [MDN Web Docs: HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP)
- [RFC 2616](https://www.rfc-editor.org/rfc/rfc2616)

---
