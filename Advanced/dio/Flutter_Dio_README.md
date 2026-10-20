# Flutter Dio — README

A practical guide to using **Dio**, an HTTP client for Dart and Flutter.

## Table of contents

1. [What is Dio?](#1-what-is-dio)
2. [Installation](#2-installation)
3. [Basic HTTP requests](#3-basic-http-requests)
4. [Understanding the response](#4-understanding-the-response)
5. [Dio instance and configuration](#5-dio-instance-and-configuration)
6. [Query parameters](#6-query-parameters)
7. [Authentication and tokens](#7-authentication-and-tokens)
8. [Interceptors](#8-interceptors)
9. [Error handling](#9-error-handling)
10. [Uploading and downloading files](#10-uploading-and-downloading-files)
11. [Cancelling requests](#11-cancelling-requests)
12. [Recommended project structure](#12-recommended-project-structure)
13. [Best practices](#13-best-practices)
14. [Dio vs. the `http` package](#14-dio-vs-the-http-package)
15. [Quick reference](#15-quick-reference)

---

## 1. What is Dio?

**Dio** is a powerful HTTP client for Dart and Flutter that allows applications to communicate with APIs over the internet.

It can send HTTP requests, receive responses, handle errors, upload and download files, and configure network communication.

Dio is an alternative to Dart's built-in `http` package. It includes additional features such as interceptors, request cancellation, timeouts, and centralized configuration.

**Official resources**

- [GitHub repository](https://github.com/cfug/dio)
- [Dio on pub.dev](https://pub.dev/packages/dio)
- [Dio API documentation](https://pub.dev/documentation/dio/latest/)

---

## 2. Installation

Add Dio to your Flutter project:

```bash
flutter pub add dio
```

Import it into your Dart file:

```dart
import 'package:dio/dio.dart';
```

---

## 3. Basic HTTP requests

HTTP methods describe the action you want to perform on an API resource.

| Method   | Typical purpose                    |
| -------- | ---------------------------------- |
| `GET`    | Retrieve data                      |
| `POST`   | Create data or submit an operation |
| `PUT`    | Replace or update a resource       |
| `PATCH`  | Partially update a resource        |
| `DELETE` | Delete a resource                  |

The examples below use JSONPlaceholder for demonstration. Replace the example URLs with your actual API endpoints.

### GET — Retrieve data

Use `GET` to fetch information from an API.

```dart
import 'package:dio/dio.dart';

final dio = Dio();

Future<void> getUsers() async {
  try {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/users',
    );

    print(response.data);
  } on DioException catch (e) {
    print('Request failed: ${e.message}');
  }
}
```

**What this does**

1. Sends a `GET` request to the users endpoint.
2. Waits for the server response.
3. Prints the response body through `response.data`.
4. Catches Dio-specific errors if the request fails.

### POST — Create data

Use `POST` to send data to an API, commonly to create a resource.

```dart
Future<void> createUser() async {
  try {
    final response = await dio.post(
      'https://jsonplaceholder.typicode.com/users',
      data: {
        'name': 'John Doe',
        'email': 'john@example.com',
      },
    );

    print(response.data);
  } on DioException catch (e) {
    print('Request failed: ${e.message}');
  }
}
```

The `data` argument contains the request body. Dio can serialize a Dart map to JSON when the request is configured appropriately.

### PUT — Replace or update a resource

Use `PUT` when the API defines the operation as replacing or updating a resource.

```dart
final response = await dio.put(
  'https://api.example.com/users/1',
  data: {
    'name': 'John Updated',
  },
);
```

### PATCH — Partially update a resource

Use `PATCH` when you want to update only selected fields of a resource.

```dart
final response = await dio.patch(
  'https://api.example.com/users/1',
  data: {
    'name': 'John Updated',
  },
);
```

### DELETE — Delete a resource

Use `DELETE` to ask the API to delete a resource.

```dart
final response = await dio.delete(
  'https://api.example.com/users/1',
);
```

> **Important:** These examples show request syntax. The actual behavior of `PUT`, `PATCH`, and `DELETE` depends on how your API is implemented.

---

## 4. Understanding the response

Dio returns a `Response` object containing information about the HTTP request.

```dart
final response = await dio.get(
  'https://api.example.com/users',
);

print(response.data);            // Response body
print(response.statusCode);      // HTTP status code
print(response.headers);         // Response headers
print(response.requestOptions);  // Original request configuration
```

Important properties:

| Property         | Description                              |
| ---------------- | ---------------------------------------- |
| `data`           | Response body, often decoded JSON        |
| `statusCode`     | HTTP status code, such as `200` or `404` |
| `headers`        | Response headers                         |
| `requestOptions` | Information about the original request   |
| `statusMessage`  | Optional status message                  |

Dio automatically decodes JSON responses when the server returns an appropriate JSON content type.

---

## 5. Dio instance and configuration

Instead of creating a new Dio instance for every request, create a reusable instance with centralized configuration.

```dart
import 'package:dio/dio.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.example.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );
}
```

Usage:

```dart
final response = await ApiClient.dio.get('/users');
```

Because `baseUrl` is configured, you only need to provide the endpoint path.

### Common configuration options

| Option            | Purpose                                                            |
| ----------------- | ------------------------------------------------------------------ |
| `baseUrl`         | Base address of the API                                            |
| `connectTimeout`  | Maximum time to establish a connection                             |
| `receiveTimeout`  | Maximum waiting time between received data events                  |
| `sendTimeout`     | Maximum time allowed for sending data                              |
| `headers`         | Default HTTP headers                                               |
| `queryParameters` | Default URL query parameters                                       |
| `responseType`    | Expected response format                                           |
| `validateStatus`  | Determines which status codes are accepted as successful responses |

---

## 6. Query parameters

Query parameters let you filter, search, sort, or paginate API results.

```dart
final response = await ApiClient.dio.get(
  '/users',
  queryParameters: {
    'page': 1,
    'limit': 10,
    'search': 'John',
  },
);
```

This produces a URL similar to:

```text
https://api.example.com/users?page=1&limit=10&search=John
```

Dio handles query parameter encoding.

---

## 7. Authentication and tokens

Many APIs require an access token, commonly sent through the `Authorization` header.

```dart
final response = await ApiClient.dio.get(
  '/profile',
  options: Options(
    headers: {
      'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
    },
  ),
);
```

For a real application, store tokens using an appropriate secure storage solution rather than hardcoding them.

You can also configure the authorization header globally or attach it automatically through an interceptor.

---

## 8. Interceptors

Interceptors allow you to inspect or modify requests, responses, and errors before they reach your application code.

They are useful for:

- Adding authentication tokens.
- Logging requests and responses during development.
- Handling common API errors.
- Refreshing expired tokens.
- Adding shared headers.

Example:

```dart
ApiClient.dio.interceptors.add(
  InterceptorsWrapper(
    onRequest: (options, handler) {
      print('Request: ${options.method} ${options.uri}');
      handler.next(options);
    },
    onResponse: (response, handler) {
      print('Status: ${response.statusCode}');
      handler.next(response);
    },
    onError: (error, handler) {
      print('Error: ${error.message}');
      handler.next(error);
    },
  ),
);
```

> **Security note:** Avoid logging passwords, access tokens, or other sensitive information. Token-refresh logic should also prevent infinite retry loops.

---

## 9. Error handling

Dio throws `DioException` for many request failures, including connection errors, timeouts, and unsuccessful HTTP responses under the default status validation behavior.

```dart
try {
  final response = await ApiClient.dio.get('/users');
  print(response.data);
} on DioException catch (e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      print('Connection timeout');
      break;

    case DioExceptionType.sendTimeout:
      print('Request sending timed out');
      break;

    case DioExceptionType.receiveTimeout:
      print('Response timed out');
      break;

    case DioExceptionType.badResponse:
      print('HTTP error: ${e.response?.statusCode}');
      break;

    case DioExceptionType.connectionError:
      print('Network connection error');
      break;

    case DioExceptionType.cancel:
      print('Request cancelled');
      break;

    default:
      print('Unexpected error: ${e.message}');
  }
}
```

Always handle errors appropriately in the user interface. For example, display a useful message when the network is unavailable instead of leaving the screen loading indefinitely.

---

## 10. Uploading and downloading files

### Upload a file

Dio supports multipart requests through `FormData` and `MultipartFile`.

```dart
final formData = FormData.fromMap({
  'name': 'Profile photo',
  'file': await MultipartFile.fromFile(
    '/path/to/image.jpg',
    filename: 'image.jpg',
  ),
});

final response = await ApiClient.dio.post(
  '/upload',
  data: formData,
);

print(response.data);
```

The file path must exist and be accessible on the device.

### Download a file

```dart
await ApiClient.dio.download(
  'https://example.com/document.pdf',
  '/path/to/document.pdf',
);
```

Choose a valid destination path appropriate for the platform. For mobile applications, you may need a file-system package to obtain an accessible directory.

---

## 11. Cancelling requests

Dio supports request cancellation using `CancelToken`.

```dart
final cancelToken = CancelToken();

final request = ApiClient.dio.get(
  '/users',
  cancelToken: cancelToken,
);

// Cancel the request when needed.
cancelToken.cancel('Request cancelled');
```

Use cancellation when a user leaves a screen or when an obsolete search request should no longer continue.

---

## 12. Recommended project structure

For a maintainable Flutter application, separate API configuration, endpoint operations, models, and UI code.

```text
lib/
├── core/
│   └── network/
│       └── api_client.dart
├── data/
│   ├── models/
│   │   └── user_model.dart
│   └── repositories/
│       └── user_repository.dart
├── features/
│   └── users/
│       └── presentation/
│           └── users_page.dart
└── main.dart
```

### Responsibilities

- **ApiClient:** Configures Dio and shared network behavior.
- **Models:** Convert JSON data into typed Dart objects.
- **Repositories:** Encapsulate API operations and data retrieval.
- **Presentation:** Displays data and handles user interactions.
- **State management:** Manages loading, success, and error states using your chosen approach, such as Provider, Riverpod, or Bloc.

Avoid placing all HTTP requests directly inside widgets.

---

## 13. Best practices

1. **Use a shared Dio instance** for consistent configuration.
2. **Define a base URL** instead of repeating the API address.
3. **Configure timeouts** to prevent requests from waiting indefinitely.
4. **Handle exceptions** and show meaningful feedback to users.
5. **Use models** instead of passing unstructured JSON throughout the application.
6. **Keep API logic separate** from UI code using services or repositories.
7. **Protect authentication tokens** with secure storage.
8. **Use interceptors carefully** for authentication, logging, and shared error handling.
9. **Avoid logging sensitive data**, especially in production.
10. **Test network logic** by mocking or injecting the HTTP client.
11. **Use environment-specific configuration** for development, testing, and production API URLs.
12. **Check API documentation** for authentication requirements, response formats, and expected status codes.

---

## 14. Dio vs. the `http` package

| Feature                           | Dio                                             | `http`                                                          |
| --------------------------------- | ----------------------------------------------- | --------------------------------------------------------------- |
| Basic HTTP requests               | Yes                                             | Yes                                                             |
| Request and response interceptors | Built-in                                        | Not built-in                                                    |
| Timeout configuration             | Built-in options                                | Available through client and request APIs                       |
| File uploads                      | `FormData` and `MultipartFile`                  | Multipart request APIs                                          |
| File downloads                    | Convenient download API                         | Usually requires additional handling                            |
| Request cancellation              | `CancelToken`                                   | Different cancellation capabilities depending on API and client |
| Configuration                     | Centralized `BaseOptions`                       | Client-based configuration                                      |
| Best suited for                   | Applications needing richer networking features | Simple HTTP requests and lightweight clients                    |

Neither package is universally better. Choose based on the complexity and requirements of your application.

---

## 15. Quick reference

| Task                         | Dio API                        |
| ---------------------------- | ------------------------------ |
| GET request                  | `dio.get()`                    |
| POST request                 | `dio.post()`                   |
| PUT request                  | `dio.put()`                    |
| PATCH request                | `dio.patch()`                  |
| DELETE request               | `dio.delete()`                 |
| Configure client             | `BaseOptions()`                |
| Add query parameters         | `queryParameters`              |
| Set request-specific headers | `Options(headers: ...)`        |
| Intercept requests           | `InterceptorsWrapper()`        |
| Handle network exceptions    | `DioException`                 |
| Upload files                 | `FormData` and `MultipartFile` |
| Download files               | `dio.download()`               |
| Cancel a request             | `CancelToken`                  |

---

## Conclusion

Dio is a flexible HTTP client that simplifies API communication in Flutter applications. Its most important features include centralized configuration, HTTP methods, interceptors, error handling, authentication support, file transfers, and request cancellation.

For most medium-to-large Flutter projects, a good starting point is to create a shared `ApiClient`, define typed models, and organize API operations into repositories or services.

**Recommended learning order**

1. HTTP methods and responses.
2. Dio configuration and timeouts.
3. JSON parsing and models.
4. Error handling.
5. Services and repositories.
6. Authentication and interceptors.
7. File uploads, downloads, and request cancellation.
