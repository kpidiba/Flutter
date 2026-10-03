# Dart Null Safety & Operators

A simple guide to understanding **null safety**, `?`, `!`, `??`, `??=`, and related operators in Dart.

## 1. What is Null Safety?

Null safety means Dart helps you prevent errors caused by using a value that is `null`.

By default, variables **cannot be null**:

```
String name = "David";
```

This is not allowed:

```
String name = null; // ❌ Error
```

If a variable is allowed to contain `null`, add `?`:

```
String? name = null; // ✅
```

---

## 2. `?` — Nullable Variable

Use `?` after a type when the value can be `null`.

```
String? name;

name = "David";
name = null;
```

Without `?`:

```
String name = null; // ❌
```

With `?`:

```
String? name = null; // ✅
```

### Example

```
int? age;

age = 25;
age = null;
```

---

## 3. `!` — Null Assertion Operator

`!` tells Dart:

> "I know this value is not null."

```
String? name = "David";

print(name!.length);
```

Here, `name` is nullable (`String?`), but `!` tells Dart that it currently contains a value.

### ⚠️ Be careful

If the value actually is `null`:

```
String? name = null;

print(name!.length); // ❌ Runtime error
```

So don't use `!` unless you are reasonably certain the value isn't null.

---

## 4. `??` — Default Value

Use `??` when you want a fallback value if something is `null`.

```
String? name;

print(name ?? "Guest");
```

Output:

```
Guest
```

Another example:

```
String? username = "David";

print(username ?? "Guest");
```

Output:

```
David
```

Think:

```
value ?? fallback
```

> "Use `value` if it isn't null; otherwise use `fallback`."

---

## 5. `??=` — Assign Only If Null

`??=` assigns a value **only when the variable is null**.

```
String? name;

name ??= "Guest";

print(name);
```

Output:

```
Guest
```

If it already has a value:

```
String? name = "David";

name ??= "Guest";

print(name);
```

Output:

```
David
```

---

## 6. `?.` — Null-Aware Access

Use `?.` to access something only if the object isn't null.

```
String? name;

print(name?.length);
```

Since `name` is null, Dart doesn't try to access `length`.

Another example:

```
String? name = "David";

print(name?.length);
```

Output:

```
5
```

Compare:

```
name!.length // "I guarantee name isn't null"
```

with:

```
name?.length // "Only access length if name isn't null"
```

---

## 7. Common Operators

### Arithmetic

```
int a = 10;
int b = 3;

a + b; // 13
a - b; // 7
a * b; // 30
a / b; // 3.333...
a ~/ b; // 3
a % b; // 1
```

### Comparison

```
a == b; // equal
a != b; // not equal
a > b;
a < b;
a >= b;
a <= b;
```

### Logical

```
&& // AND
|| // OR
!  // NOT
```

Example:

```
bool isAdult = true;
bool hasId = true;

if (isAdult && hasId) {  print("Allowed");}
```

---

## 8. `!` Has Two Meanings

Don't confuse these two uses.

### Logical NOT

```
bool isLoggedIn = false;

print(!isLoggedIn); // true
```

Here `!` means **NOT**.

### Null assertion

```
String? name = "David";

print(name!.length);
```

Here `!` means **"this nullable value is definitely not null."**

---

## 9. Quick Cheat Sheet

| Operator | Meaning              | Example            |
| -------- | -------------------- | ------------------ |
| `?`      | Allows `null`        | `String? name`     |
| `!`      | Assert non-null      | `name!`            |
| `?.`     | Access if not null   | `name?.length`     |
| `??`     | Use fallback if null | `name ?? "Guest"`  |
| `??=`    | Assign if null       | `name ??= "Guest"` |
| `==`     | Equal                | `a == b`           |
| `!=`     | Not equal            | `a != b`           |
| `&&`     | AND                  | `a && b`           |
| `        |                      | `                  |
| `!`      | NOT                  | `!isLoggedIn`      |

### The most important ones to remember

```
String name = "David";       // Cannot be null

String? name = null;        // Can be null

name?.length;               // Safely access

name ?? "Guest";            // Fallback

name ??= "Guest";           // Set if null

name!.length;               // "I guarantee it's not null"
```

**Rule of thumb:** Prefer `?.` and `??` for safe null handling. Use `!` only when you genuinely know the value cannot be null.

Keep exploring Dart null safety
