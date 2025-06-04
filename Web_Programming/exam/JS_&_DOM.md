
# 📚 JavaScript & DOM Study Guide & Cheat Sheet

## 🧠 JavaScript Basics

- Lightweight, interpreted, event-driven language for browsers
- Created by Netscape; runs client-side (in browser)
- Current standard: ECMAScript 2020 (ES11); major adoption of ES6+
- Weakly typed (dynamic types), functions are first-class citizens

---

## ✨ Data Types & Variables

- Primitive types: `number`, `string`, `boolean`, `undefined`, `null`, `symbol`, `bigint`
- Special values: `NaN`, `Infinity`, `undefined`
- Strings: `'text'`, `"text"`, `` `template` ``
- Arrays: `[1, 2, 3]`, `Array(5)`
- Objects: `{ key: value }`
- Declare with `var`, `let`, `const` (prefer `let` and `const`)
- `let`: block scoped, `const`: cannot be reassigned

---

## ➕ Operators & Type Coercion

- Arithmetic: `+`, `-`, `*`, `/`, `%`, `**`
- String concatenation: `+`
- Comparison: `==`, `===`, `!=`, `!==`, `<`, `>`, `<=`, `>=`
- Logical: `&&`, `||`, `!`
- Bitwise: `&`, `|`, `^`, `~`, `<<`, `>>`
- Type conversion: `2 + "3"` = `"23"`, `"5" - 1` = `4`, `[] == 0` → `true`

---

## 🔁 Control Structures

- Conditional: `if`, `else`, `switch`
- Loops: `for`, `while`, `do...while`, `for...in`, `for...of`
- Exception handling: `try { ... } catch (e) { ... }`

---

## 📦 Functions

- Declared: `function name(params) { ... }`
- Expression: `const f = function(x) { return x }`
- Arrow: `const f = (x) => x * 2`
- Rest: `function f(...args) { }`
- Default: `function f(x = 1) { }`
- Closures: inner functions access outer scope
- Hoisting applies to function declarations

---

## 🧪 Objects & Classes

- Object literal: `{ name: "Alex", age: 22 }`
- Constructor: `function Person(name) { this.name = name }`
- ES6 Class: `class Student { constructor() { ... } }`
- Inheritance: `class Child extends Parent { }`
- `this`: current object
- Static methods: `static methodName() { }`
- Private fields: `#name`, `#age`

---

## 🔢 Arrays & Methods

- `push`, `pop`, `shift`, `unshift`, `splice`, `slice`, `concat`, `join`
- `forEach`, `map`, `filter`, `reduce`, `sort`, `indexOf`
- `length`: highest index + 1

---

## 📚 Strings

- Methods: `length`, `charAt`, `includes`, `indexOf`, `startsWith`, `endsWith`, `slice`, `substring`, `split`, `replace`, `toLowerCase`, `toUpperCase`

---

## 📤 Asynchronous JS

### setTimeout & Promises

```js
setTimeout(() => console.log("Hello"), 1000);
const p = new Promise((resolve, reject) => resolve("Done"));
p.then(result => console.log(result));
```

### async/await

```js
async function fetchData() {
  const res = await fetch(url);
  const data = await res.json();
  return data;
}
```

---

## 📁 Modules

- Export:  
  ```js
  export const x = 5;
  export default function() { }
  ```
- Import:
  ```js
  import { x } from "./file.js";
  import * as mod from "./file.js";
  ```

---

## 🖱️ Events

- Event handlers: `onclick`, `onload`, `onmouseover`, etc.
- `addEventListener("click", fn)`
- Common events: `click`, `keydown`, `submit`, `change`, `focus`, `blur`

---

## 🧱 DOM (Document Object Model)

- `document.getElementById(id)`
- `document.querySelector(".class")`
- `element.innerHTML`, `element.innerText`
- `element.setAttribute()`, `element.style`
- Creating: `document.createElement("p")`
- Appending: `parent.appendChild(child)`
- Removing: `element.remove()`

---

## 🧭 DOM Navigation

- `parentNode`, `firstChild`, `lastChild`
- `children`, `nextSibling`, `previousSibling`
- `.style`, `.classList`, `.className`

---

## 💬 Dialogs

- `alert("Hello")`
- `confirm("Are you sure?")`
- `prompt("Enter name", "default")`

---

## ⚠️ Strict Mode

- Add `"use strict";` at the top of scripts/functions
- Prevents silent errors, improves performance
- Disallows some legacy JS quirks

---

## 🧪 Debugging & Tools

- Tools: Chrome DevTools, Firefox Web Console
- Sandboxes: [JSFiddle](https://jsfiddle.net), [CodePen](https://codepen.io)

---

## 🔗 Useful Links

- [MDN JavaScript Guide](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
- [W3Schools JavaScript](https://www.w3schools.com/js)
- [JS DOM Reference](https://www.w3schools.com/jsref/dom_obj_document.asp)

---
