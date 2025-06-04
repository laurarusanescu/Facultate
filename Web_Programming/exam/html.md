
# 🧠 HTML Study Guide & Cheat Sheet

## 🧠 Key Concepts to Learn

### 1. What is HTML?
- **HTML (HyperText Markup Language)** is the standard language used to create web pages.
- Created by **Tim Berners-Lee** in **1990** at CERN.
- Maintained by the **W3C (World Wide Web Consortium)**.
- Uses **tags** to define and format content on web pages.

---

## 🕰️ HTML History

- **1991**: First version by Tim Berners-Lee.
- **1995**: HTML 2.0
- **1997**: HTML 3.2 and 4.0
- **1999**: HTML 4.01
- **2014**: HTML5 became a W3C recommendation
- **2017**: HTML5.2 finalized

---

## 🧩 Structure of an HTML Document

```html
<!DOCTYPE html>
<html>
  <head>
    <title>My Title</title>
  </head>
  <body>
    Hello World!
  </body>
</html>
```

- `<!DOCTYPE html>`: declares the document type.
- `<html>`: root element.
- `<head>`: metadata, links, scripts.
- `<body>`: content visible to users.

---

## 🏷️ Important HTML Tags

### ➤ Metadata Tags (used inside `<head>`)
- `<title>`, `<meta>`, `<link>`, `<style>`, `<base>`, `<script>`

### ➤ Section Tags
- `<div>`, `<header>`, `<footer>`, `<main>`, `<section>`, `<article>`, `<nav>`, `<aside>`, `<body>`, `<head>`

### ➤ Text Formatting
- `<b>`, `<i>`, `<strong>`, `<em>`, `<u>`, `<s>`, `<sub>`, `<sup>`, `<small>`, `<big>`, `<pre>`

### ➤ Grouping & Lists
- **Ordered list**: `<ol>`, `<li>`
- **Unordered list**: `<ul>`, `<li>`
- **Definition list**: `<dl>`, `<dt>`, `<dd>`
- **Dropdown**: `<select>`, `<option>`

### ➤ Media & Links
- **Image**: `<img src="..." alt="...">`
- **Link**: `<a href="...">Text</a>`
- **Anchors**: `<a name="bookmark">` + `#bookmark`
- **Multimedia**: `<video>`, `<audio>`, `<object>`, `<svg>`

### ➤ Tables

```html
<table border="1">
  <tr><th>Header1</th></tr>
  <tr><td>Data</td></tr>
</table>
```

- Tags: `<table>`, `<tr>`, `<td>`, `<th>`
- Attributes: `rowspan`, `colspan`, `border`, `align`, `width`, `height`

---

## 🌐 HTML5 Structural Tags

- `<main>`: Unique main content
- `<section>`: Thematic content group
- `<article>`: Self-contained content (e.g. blog post)
- `<nav>`: Navigation links
- `<aside>`: Sidebar/side content
- `<header>` and `<footer>`: Page/section headers/footers

---

## ⚙️ Useful Tags

- `<br>`: Line break
- `<hr>`: Horizontal line
- `<!-- comment -->`: HTML comment

---

## 🧩 Global Attributes

| Attribute        | Description               |
|------------------|---------------------------|
| `id`             | Unique identifier         |
| `class`          | Class for CSS             |
| `style`          | Inline style              |
| `title`          | Tooltip text              |
| `hidden`         | Hide element              |
| `contenteditable`| Make content editable     |
| `draggable`      | Allow dragging            |

---

## ⚡ Quick Tips for the Exam

- Memorize basic **syntax** and **structure**.
- Know the difference between **inline** (e.g., `<b>`, `<a>`) and **block-level** tags (e.g., `<div>`, `<p>`).
- Practice writing simple HTML with **forms, tables, and media**.
- Understand **HTML5 semantic tags** and when to use them.

---
