
# 💡 jQuery Study Guide & Cheat Sheet

---

## 🧠 What is jQuery?

- A fast, small, and feature-rich JavaScript library
- Simplifies HTML DOM traversal and manipulation
- Cross-browser compatible
- Download from [jQuery.com](https://jquery.com)
- Include via CDN:
```html
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
```

---

## 🚀 Basic Usage

```js
$(document).ready(function() {
  // Your jQuery code here
});

$(function() {
  // Short-hand for document ready
});
```

---

## 🔍 Selectors (CSS-like)

```js
$("#id")               // ID selector
$(".class")            // Class selector
$("div")               // Tag selector
$("div.class")         // Tag + class
$("div p")             // Descendant
$("p:first")           // First paragraph
$("ul li:eq(2)")       // 3rd list item
$("[href]")            // Elements with href
$("[type='text']")     // Elements with type="text"
```

---

## 🧭 DOM Traversal & Content

- `.text()`, `.html()`, `.val()`
- `.attr("attrName")`, `.attr("attrName", "value")`
- `.append()`, `.prepend()`, `.before()`, `.after()`
- `.remove()`, `.empty()`

---

## 🎨 CSS & Classes

```js
$("p").css("color", "red");
$("p").css({ width: "100px", height: "50px" });

$("#div1").addClass("fancy");
$("#div1").removeClass("fancy");
$("#div1").toggleClass("fancy");
```

---

## 📦 Effects

```js
// Show/Hide
$("p").hide(); $("p").show(); $("p").toggle();

// Fade
$("#div1").fadeIn(); $("#div1").fadeOut(); $("#div1").fadeTo(2000, 0.5);

// Slide
$("#div1").slideUp(); $("#div1").slideDown(); $("#div1").slideToggle();
```

---

## 🌀 Animations

```js
$("#div1").animate({ left: '100px', top: '75px' }, 2000);
$("#div1").animate({
  left: '500px',
  opacity: '0.3',
  height: '100px',
  width: '60px'
});
```

---

## 🖱️ Events

```js
$("p").click(function() { ... });
$("div").dblclick(function() { $(this).hide(); });
$("li").on("click", function() { console.log("clicked"); });
$("form").on("submit", function(e) { e.preventDefault(); });
$("button").one("click", function() { alert("This will run once"); });
```

---

## 🔄 Event Object

```js
$("form").on("submit", function(event) {
  event.preventDefault(); // cancel default action
});
```

- `event.pageX`, `event.pageY`: mouse position
- `event.type`: event type
- `event.target`: element that triggered the event

---

## 🔧 Utility Methods

```js
$.each(["a", "b", "c"], function(index, value) {
  console.log(index + ": " + value);
});
```

---

## 📚 Resources

- [jQuery Docs](https://api.jquery.com/)
- [jQuery Selectors](https://api.jquery.com/category/selectors/)
- [jQuery Effects](https://api.jquery.com/category/effects/)
- [jQuery Events](https://api.jquery.com/category/events/)

---
