# FLUTTER SECURE STORAGE

[flutter_secure_storage | Flutter Package](https://pub.dev/packages/flutter_secure_storage)

package uses SharedPreferences with MODE_PRIVATE

```dart
preferences = context.getSharedPreferences(SHARED_PREFERENCES_NAME, Context.MODE_PRIVATE);
```

It also uses additional encryption via AES. From [readme](https://github.com/mogol/flutter_secure_storage#flutter_secure_storage): `AES encryption is used for Android. AES secret key is encrypted with RSA and RSA key is stored in KeyStore`. You can find details in the [source code](https://github.com/mogol/flutter_secure_storage/tree/develop/android/src/main/java/com/it_nomads/fluttersecurestorage).

As for secure tokens and other sensitive data, it would be safer to use `flutter_secure_storage` instead of raw SharedPreferences with private mode.
