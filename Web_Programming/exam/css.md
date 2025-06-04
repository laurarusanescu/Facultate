
# 🎨 CSS Study Guide & Cheat Sheet

## 🧠 Key Concepts

- **CSS (Cascading Style Sheets)** defines how to display HTML documents: fonts, colors, layouts, etc.
- CSS was added to HTML to **separate content (HTML)** from **presentation (CSS)**.
- Allows site-wide changes by editing a single file.
- Usually stored in `.css` files, but can be internal or inline.

---

## 📝 Why CSS?

- HTML is for structure; CSS is for **styling**.
- Before CSS, style was scattered in HTML, making maintenance hard.
- CSS keeps style info separate, making web design easier.

---

## 🔤 CSS Syntax

```css
selector { property: value; property: value; }
```
- **Selectors:** tag name, class, id, pseudo-class, pseudo-element.
  - By tag: `p { ... }`
  - By class: `.right { ... }` → `<p class="right">...</p>`
  - By id: `#green { ... }` → `<div id="green">...</div>`
  - By multiple tags: `h1, h2 { ... }`
  - Pseudo-classes: `a:hover { ... }`
  - Pseudo-elements: `p::first-line { ... }`

---

## 🎯 Example

```css
body { background-color: #aabbcc; }
h1 { font-style: italic; font-size: 36pt; }
h2 { color: blue; }
p { margin-left: 50px; }
```

---

## 🔗 How to Add CSS

- **External:**  
  `<link rel="stylesheet" type="text/css" href="style.css">`
- **Internal:**  
  `<style> ... </style>` inside `<head>`
- **Inline:**  
  `<p style="color:red;">Text</p>`

**Priority (lowest to highest):**  
1. Browser default  
2. External  
3. Internal  
4. Inline

---

## 🧩 CSS Selectors

| Selector Type   | Example               | Usage                                  |
|-----------------|-----------------------|----------------------------------------|
| Tag             | `p {}`                | By HTML tag                            |
| Class           | `.blue {}`            | `<div class="blue">`                   |
| ID              | `#header {}`          | `<div id="header">`                    |
| Multiple        | `h1, h2 {}`           | Group tags                             |
| Pseudo-class    | `a:hover {}`          | Hover, focus, visited, etc.            |
| Pseudo-element  | `p::first-line {}`    | Style first line/letter, before/after  |

---

## 🌈 Background Properties

| Property               | Description                                  |
|------------------------|----------------------------------------------|
| background             | All background properties (shorthand)        |
| background-color       | Background color                             |
| background-image       | Background image                             |
| background-position    | Start position of background image           |
| background-repeat      | Repeat pattern (x, y, both, none)            |
| background-attachment  | Fixed or scrolls with page                   |

---

## 📦 CSS Box Model

Every element is a "box" with:
- **Content** (the text/image)
- **Padding** (space around content)
- **Border** (around padding)
- **Margin** (space outside border)

**Total size:**  
`total width = width + padding + border + margin`  
`total height = height + padding + border + margin`

---

## 🎨 Border & Outline Properties

| Property                | Description                                  |
|-------------------------|----------------------------------------------|
| border                  | All border properties                        |
| border-top/bottom/left/right | Side-specific border settings          |
| border-color            | Color of border                              |
| border-style            | Style (solid, dashed, dotted, etc.)          |
| border-width            | Width                                        |
| outline                 | Outline around element (not part of box model)|

---

## 📏 Dimension Properties

| Property    | Description                  |
|-------------|-----------------------------|
| width       | Element width               |
| height      | Element height              |
| min-width   | Minimum width               |
| max-width   | Maximum width               |
| min-height  | Minimum height              |
| max-height  | Maximum height              |

---

## 🅰️ Font Properties

| Property      | Description                                |
|---------------|--------------------------------------------|
| font          | Shorthand for all font properties          |
| font-family   | Font name(s)                               |
| font-size     | Size (px, em, rem, etc.)                   |
| font-style    | normal, italic, oblique                    |
| font-weight   | bold, normal, 100-900                      |
| font-variant  | small-caps, normal                         |

---

## 📝 Text Properties

| Property         | Description                                 |
|------------------|---------------------------------------------|
| color            | Text color                                  |
| text-align       | Alignment: left, right, center, justify     |
| text-decoration  | underline, overline, line-through, none     |
| text-indent      | First-line indentation                      |
| text-shadow      | Shadow effect                               |
| text-transform   | uppercase, lowercase, capitalize            |
| line-height      | Spacing between lines                       |
| letter-spacing   | Space between characters                    |
| word-spacing     | Space between words                         |
| direction        | ltr, rtl                                    |
| vertical-align   | Baseline, top, middle, bottom               |
| white-space      | Handling whitespace                         |

---

## 🔡 List Properties

| Property             | Description                              |
|----------------------|------------------------------------------|
| list-style           | Shorthand for all list properties        |
| list-style-type      | Marker style: disc, circle, square, none |
| list-style-image     | Custom marker image                      |
| list-style-position  | Marker inside or outside                 |

---

## ➗ Margin & Padding

| Property           | Description                               |
|--------------------|-------------------------------------------|
| margin             | Shorthand for all margins                 |
| margin-top/right/bottom/left | Individual side margins        |
| padding            | Shorthand for all paddings                |
| padding-top/right/bottom/left | Individual side paddings      |

---

## ⬜ Table Properties

| Property             | Description                              |
|----------------------|------------------------------------------|
| border-collapse      | Collapse or separate borders             |
| border-spacing       | Distance between cell borders            |
| caption-side         | Caption placement                        |
| empty-cells          | Show/hide borders on empty cells         |
| table-layout         | Algorithm for table layout                |

---

## ↔️ Display & Visibility

- `display: block;` — takes full width, line break (e.g. `<div>`)
- `display: inline;` — flows with text, no line break (e.g. `<span>`)
- `display: none;` — element not shown and no space taken
- `visibility: hidden;` — element hidden but space is still reserved
- `opacity: 0.5;` — transparent (0.0–1.0)

---

## 📐 Positioning & Float

| Property      | Description                                    |
|---------------|------------------------------------------------|
| position      | static, relative, absolute, fixed              |
| top/right/bottom/left | Offsets for positioned elements        |
| z-index       | Stack order                                    |
| float         | Push element left or right, allows wrapping    |
| clear         | Prevents floating elements beside              |
| overflow      | What happens if content overflows              |

---

## ⚡ Quick Tips

- Use **external CSS** for site-wide styling.
- Know the difference: `block` vs. `inline`.
- Use classes for re-usable styles, ids for unique elements.
- Use the **CSS box model** when designing layouts.
- Practice with selectors, pseudo-classes (`:hover`), and pseudo-elements (`::first-line`).
- Use developer tools in your browser to test CSS changes live.

---

## 🏁 Example: Box Model Diagram

```
+-------------------------+
|      Margin             |
|  +-------------------+  |
|  |    Border         |  |
|  | +-------------+   |  |
|  | | Padding     |   |  |
|  | | +-------+   |   |  |
|  | | |Content|   |   |  |
|  | | +-------+   |   |  |
|  | +-------------+   |  |
|  +-------------------+  |
+-------------------------+
```

---

## Sources

- Your lecture slides: "CSS - Cascading Style Sheets.pptx.pdf"
- [w3schools.com](https://www.w3schools.com/css/)

---
