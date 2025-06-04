
# 🧠 TypeScript Study Guide & Cheat Sheet

---

## 🌐 What is TypeScript?

- Open-source language developed by Microsoft
- Superset of JavaScript → all JS is valid TypeScript
- Adds **static typing**, **classes**, and **interfaces**
- Compiles (`transpiles`) to JavaScript using `tsc`

---

## 🧾 Primitive Types

```ts
let a: number = 10;
let b: string = "Hello";
let c: boolean = true;
let d: null = null;
let e: undefined = undefined;
let f: symbol = Symbol("id");
```

---

## 🧮 Special Types

- `any`: disable type checking
- `unknown`: type-safe alternative to `any`
- `void`: function returns nothing
- `never`: function never returns (e.g., throws error)

---

## 🔀 Union & Literal Types

```ts
let value: string | number = "str";
value = 10; // OK
value = false; // ❌ error

let state: "on" | "off" = "on";
```

---

## 🧬 Type Aliases & Interfaces

```ts
type User = { name: string, age: number };
interface Person { firstName: string; lastName: string; }
```

---

## 🧱 Object & Array Types

```ts
let obj: { name: string } = { name: "John" };
let arr: string[] = ["a", "b"];
let mixedArr: (string | number)[] = ["a", 1];
```

---

## 📦 Tuples & Enums

```ts
let tuple: [number, string] = [1, "two"];

enum Color { Red, Green, Blue }
let c: Color = Color.Green;
```

---

## 🔁 Functions

```ts
function greet(name: string): void {
  console.log("Hello " + name);
}

const sum = (a: number, b: number): number => a + b;
```

- Optional: `function f(x: number, y?: string): void {}`
- Default: `function f(x: number, y: string = "hi") {}`
- Function type: `(x: string) => void`

---

## 🧰 Type Assertions

```ts
let id: any = "123";
let numId = <string>id;
let numId2 = id as string;
```

---

## 🧪 Classes

```ts
class Person {
  constructor(public firstName: string, private age: number) {}
  greet() { console.log(this.firstName); }
}
```

- `public`, `private`, `protected`, `readonly`

---

## 🔁 Inheritance

```ts
class Student extends Person {
  constructor(firstName: string, age: number, private grade: number) {
    super(firstName, age);
  }
  showGrade() { console.log(this.grade); }
}
```

---

## 🧩 Abstract Classes

```ts
abstract class Shape {
  abstract area(): number;
}
class Circle extends Shape {
  constructor(private radius: number) { super(); }
  area() { return Math.PI * this.radius ** 2; }
}
```

---

## 📐 Interfaces

```ts
interface Animal {
  name: string;
  speak(): void;
}
```

- Can extend other interfaces
- Can define function signatures and class contracts

---

## 🧠 Generics

```ts
function identity<T>(arg: T): T {
  return arg;
}
```

- Generic arrays: `T[]` or `Array<T>`
- Generic class: `class Box<T> { value: T }`

---

## 🛠 Setup & Tools

```bash
npm install -g typescript
tsc --init
tsc file.ts
```

---

## 📚 Resources

- [TypeScript Official Site](https://www.typescriptlang.org/)
- [Playground](https://www.typescriptlang.org/play)
- [Tutorials](https://www.typescripttutorial.net/)

---
