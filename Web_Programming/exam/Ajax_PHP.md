
# 🌐 AJAX & PHP Study Guide & Cheat Sheet

---

## 🐘 PHP Basics

- **PHP** = "PHP: Hypertext Preprocessor"
- Server-side scripting language
- Interpreted, open-source, runs on Apache/IIS
- Syntax embedded in HTML using `<?php ... ?>`
- Loose typing: variables are prefixed with `$`

---

## 💡 PHP Syntax & Variables

```php
$text = "example";
$no = 4;
$vector = array(1, 2, 3);
$b = true;
```

- Reference: `$x1 = &$x;`
- `var_dump($var)` → type and value info
- Scope: global, local, static
- Superglobals: `$_GET`, `$_POST`, `$_SESSION`, `$_COOKIE`, `$_SERVER`, `$GLOBALS`

---

## 📨 Forms & Superglobals

```html
<form action="file.php" method="get">
  <input name="name" />
</form>
```

- GET: data in URL
- POST: data in request body
- PHP: `$_GET["name"]`, `$_POST["name"]`

---

## 🔢 PHP Types

- Scalars: `int`, `float`, `string`, `bool`, `null`
- Complex: `array`, `object`, `resource`
- Special: `mixed`, `callback`, `void`

---

## 🧮 Operators

- Arithmetic: `+ - * / % ++ --`
- Comparison: `== != === !== > < >= <=`
- Assignment: `= += -= *= /= .=`
- Logic: `&& || !`
- Ternary: `(condition) ? value1 : value2`
- String concatenation: `.`

---

## 📦 Arrays

```php
$a = array("key" => "value", 2 => "b");
echo $a["key"];
```

- Associative and numeric
- `count()`, `sort()`, `foreach($arr as $val)`
- Nested: `$a['key'][1]`

---

## 🔠 Strings

- Quotes: `'single'`, `"double"`
- Heredoc/Nowdoc
- Operators: `.` for concat
- Functions: `strlen()`, `strpos()`, `substr()`, `str_replace()`, `printf()`

---

## 🧰 PHP Functions & OOP

```php
function sum($a, $b) {
  return $a + $b;
}
```

- `class`, `extends`, `__construct`, `__destruct`
- Visibility: `public`, `private`, `protected`

```php
class A {
  public $x = 1;
  function getX() { return $this->x; }
}
```

---

## 📂 File Includes

- `include("file.php")`, `require("file.php")`
- `include_once`, `require_once`

---

## 🍪 Cookies & Sessions

- Set cookie: `setcookie("user", "value", time()+3600);`
- Get cookie: `$_COOKIE["user"]`
- Session:
  ```php
  session_start();
  $_SESSION["user"] = "Alex";
  ```

---

## 🛢️ PHP & MySQL

```php
$con = mysqli_connect("localhost", "user", "pass", "db");
$result = mysqli_query($con, "SELECT * FROM table");
while($row = mysqli_fetch_array($result)) { echo $row['col']; }
```

---

## ⚡ AJAX Overview

- AJAX = **Asynchronous JavaScript and XML**
- Enables async communication with the server without reloading the page
- XMLHttpRequest or modern `fetch()`
- Use with PHP to create dynamic apps

---

## 🧾 JSON

- JS to JSON: `JSON.stringify(obj)`
- JSON to JS: `JSON.parse(jsonStr)`
- PHP to JSON: `json_encode($arr)`
- JSON to PHP: `json_decode($jsonStr, true)`

---

## 🕹️ AJAX with JS

```js
let xhr = new XMLHttpRequest();
xhr.open("GET", "file.php?q=val", true);
xhr.onreadystatechange = function() {
  if (xhr.readyState === 4) {
    document.getElementById("output").innerHTML = xhr.responseText;
  }
};
xhr.send();
```

---

## 🧠 Fetch API (Modern)

```js
fetch("file.php?q=test")
  .then(res => res.json())
  .then(data => console.log(data))
  .catch(err => console.error(err));
```

- Clean syntax with async/await
- Use `response.ok` to check status
- Set headers & method for POST

---

## 🔄 AJAX with jQuery

```js
// GET
$.get("file.php", { param: "val" }, function(data) {
  $("#output").html(data);
});

// POST
$.post("file.php", { param: "val" }, function(data) {
  $("#output").html(data);
});
```

---

## 📚 Resources

- [php.net](https://www.php.net)
- [phptherightway.com](https://www.phptherightway.com/)
- [MDN: Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API)

---
