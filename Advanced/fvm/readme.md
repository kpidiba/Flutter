# FVM — Flutter Version Management

**FVM (Flutter Version Management)** allows you to install and use **different Flutter versions per project**.

## 1. Install FVM

```bash
dart pub global activate fvm
```

Check:

```bash
fvm --version
```

---

## 2. Install a Flutter version

```bash
fvm install 3.35.0
```

Or use a channel:

```bash
fvm install stable
```

---

## 3. Set the Flutter version for a project

Inside your project:

```bash
fvm use 3.35.0
```

This creates:

```text
.fvm/
└── flutter_sdk
```

The project now uses this Flutter version.

---

## 4. Run Flutter commands with FVM

Instead of:

```bash
flutter run
```

Use:

```bash
fvm flutter run
```

Examples:

```bash
fvm flutter pub get
fvm flutter build apk
fvm flutter test
```

---

## 5. Check the version

```bash
fvm flutter --version
```

---

## 6. Why use FVM?

```text
Without FVM:
Project A → Flutter 3.x
Project B → Flutter 3.y
→ version conflicts

With FVM:
Project A → its own Flutter version
Project B → another Flutter version
→ isolated projects
```

### Remember

```text
fvm install → install a Flutter version
fvm use     → assign version to project
fvm flutter → run Flutter commands
fvm list → check Flutter SDK Version
fvm releases → SDK releases.
```
