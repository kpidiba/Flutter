# Future, async/await in Dart

## 1. Future

A `Future<T>` represents a value that will be available **later**.

```dart
Future<String> getUserName() async {
  return "David";
}
```

The result is not immediately available.

---

## 2. async

`async` indicates that a function performs asynchronous work and returns a `Future`.

```dart
Future<void> loadData() async {
  // asynchronous work
}
```

---

## 3. await

`await` waits for a `Future` to complete.

```dart
Future<String> getUserName() async {
  return "David";
}

Future<void> main() async {
  final name = await getUserName();

  print(name);
}
```

`await` can only be used inside an `async` function.

---

## 4. Real example

```dart
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));

  return "Data loaded";
}

Future<void> main() async {
  print("Loading...");

  final result = await fetchData();

  print(result);
}
```

Output:

```text
Loading...
// waits 2 seconds
Data loaded
```

---

## 5. Error handling

Use `try/catch` for asynchronous errors:

```dart
try {
  final data = await fetchData();
  print(data);
} catch (e) {
  print("Error: $e");
}
```

### Remember

```text
Future → result available later
async  → function can use await
await  → wait for a Future
try/catch → handle errors
```
