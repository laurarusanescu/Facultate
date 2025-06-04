
# 🌟 CSS3 Study Guide & Cheat Sheet

## 🕰️ CSS History & Levels

- **CSS Level 1:** Original CSS
- **CSS Level 2 & 2.1:** Added features and fixes
- **CSS Level 3:** Split into modules; modules evolve independently
- **Some modules** are already at Level 4 (e.g., Colors, Selectors)
- [CSS official specs](http://www.w3.org/Style/CSS/specs.en.html)
- [CSS3 summary](http://www.css3.info)

---

## 🧩 CSS3 Modules (Selection)
- Color, Namespaces, Selectors, Media Queries, Backgrounds & Borders
- 2D/3D Transforms, Transitions, Animations, Flexible Box (Flexbox)
- Fonts, Text, Grid Layout, Image Values

---

## 🎯 Advanced CSS Selectors

| Selector | Purpose |
|----------|---------|
| `E[attr^="str"]` | E with attribute starting with "str" |
| `E[attr$="str"]` | E with attribute ending with "str" |
| `E[attr*="str"]` | E with attribute containing "str" |
| `E[attr="str"]`  | E with attribute exactly "str" |
| `E:nth-child(n)` | E that is the nth child |
| `E:nth-last-child(n)` | E that is nth from the end |
| `E:first-child` | E that is first child |
| `E:last-child` | E that is last child |
| `E:only-child` | E that is the only child |
| `E:not(s1,s2,...)` | E not matching s1, s2... |
| `E:is(s1,s2,...)` | E matching any selector in list |
| `E > F` | F direct child of E |
| `E + F` | F immediately after E |
| `E ~ F` | F preceded by E |
| `*` | All elements |
| `E:has(> F)` | E having F as a child (not widely supported) |
| `E:empty` | E with no children |

---

## 🎨 Gradients

**Linear Gradient:**
```css
background: linear-gradient([direction], color-stop1, color-stop2, ...);
```
- Direction: `to right`, `45deg`, etc.
- Example:  
  `background: linear-gradient(to right, red, yellow);`

**Radial Gradient:**
```css
background: radial-gradient([position] [shape] [size], color-stop1, color-stop2, ...);
```
- Example:  
  `background: radial-gradient(circle, blue, green 80%);`

**Repeating gradients** available with `repeating-linear-gradient()` and `repeating-radial-gradient()`.

---

## 🔄 2D & 3D Transforms

**2D Transform Functions:**
- `translate(x, y)` — move
- `scale(x, y)` — resize
- `rotate(angle)` — rotate (e.g. `rotate(45deg)`)
- `skew(x-angle, y-angle)` — skew
- `matrix(...)` — advanced

**3D Transform Functions:**
- `translate3d(x, y, z)`
- `scale3d(x, y, z)`
- `rotate3d(x, y, z, angle)`
- `perspective(n)`
- `matrix3d(...)`

**Properties:**
- `transform`
- `transform-origin`
- `transform-style`
- `perspective`

---

## 🕒 Transitions

Add smooth changes between states (e.g. on hover).

**Properties:**
- `transition-property`
- `transition-duration`
- `transition-delay`
- `transition-timing-function`
- `transition` (shorthand)

**Example:**
```css
div {
  transition: width 2s, transform 2s;
}
div:hover {
  width: 200px;
  transform: rotate(10deg);
}
```

---

## 🎬 Animations

Define keyframes for CSS animation:

```css
@keyframes slide {
  from { left: 0; }
  to { left: 100px; }
}

div {
  animation: slide 2s infinite alternate;
}
```

**Animation properties:**  
- `animation-name`, `animation-duration`, `animation-timing-function`, `animation-delay`, `animation-iteration-count`, `animation-direction`, `animation-play-state`, `animation` (shorthand)

---

## 📰 Multiple Columns

- `column-count`: number of columns
- `column-gap`: space between columns
- `column-rule-color`, `column-rule-style`, `column-rule-width`: style/width/color of lines between columns
- `column-width`: width of each column
- `columns`: shorthand for `column-width` and `column-count`

**Example:**
```css
div {
  column-count: 3;
  column-gap: 20px;
}
```

---

## 🟦 Borders & Shadows

- `border-radius`: rounded corners (e.g. `border-radius: 10px 20px;`)
- `box-shadow`: shadow (e.g. `box-shadow: 2px 2px 5px #aaa;`)
- `border-image`: use an image for border

- `text-shadow`: shadow for text (e.g. `text-shadow: 2px 2px 4px #f0f;`)

---

## 🏞️ Backgrounds & Sprites

- Multiple backgrounds:  
  `background-image: url(a.png), url(b.png);`
- **Sprites**: Use one image and change `background-position` to show different parts.

---

## 📦 Flexbox Layout

Modern way to layout, align, and distribute space:

```css
.flex-container {
  display: flex;
  flex-direction: row; /* or column */
  flex-wrap: wrap;
  justify-content: center; /* horizontal align */
  align-items: center;     /* vertical align */
}
```

- `flex-direction`: row, column
- `justify-content`: flex-start, flex-end, center, space-between, space-around, space-evenly
- `align-items`: flex-start, flex-end, center, stretch, baseline

**[Flexbox Guide](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)**

---

## 🛠️ CSS Preprocessors

Add logic to CSS! Write more with less repetition.

- **LESS**, **Sass**, **Stylus**, **Compass**
- Features: variables, functions, mixins, nesting, etc.
- Example (LESS):
  ```less
  @font-size: 16px;
  .bordered(@width) {
    border: @width solid #ddd;
    &:hover { border-color: #999; }
  }
  h1 { .bordered(5px); font-size: @font-size; }
  ```

---

## 📱 Responsive Web Design

- Use `meta` viewport tag in `<head>`:
  ```html
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  ```
- Use **relative units**: %, em, rem, vw, vh
- Avoid absolute units: px, pt, cm, mm, in

**Media Queries**:
```css
@media only screen and (max-width: 600px) {
  body { background: #eee; }
}
```
- Apply CSS only under certain screen/device conditions.

**Example Responsive Layout:**
```css
body { display: flex; }
#left { width: 25%; background: #ff88aa; }
#main { width: 75%; background: #aa22ff; }
@media (max-width: 800px) {
  body { flex-direction: column; }
  #left, #main { width: 100%; }
}
```

---

## 🔤 Web Fonts & Icons

- **Web fonts:**  
  ```html
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jura">
  <style>
    body { font-family: 'Jura', sans-serif; }
  </style>
  ```

- **Google Icons:**  
  ```html
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <i class="material-icons" style="font-size:48px;color:red">folder</i>
  ```

- **FontAwesome:**  
  ```html
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <i class="fa fa-car" style="font-size:60px;color:red;"></i>
  ```

---

## 📚 More Learning

- [CSS3 Official Spec](https://www.w3.org/TR/css-2018/)
- [CSS3.info](http://www.css3.info)
- [CSS-Tricks](https://css-tricks.com)

---
