# EQUATABLE

 [equatable | Dart Package](https://pub.dev/packages/equatable) 

Package use with bloc

If you’ve been writing Dart, chances are you’ve had to override the `==` operator and `hashCode` in order to compare different instances of the same class.

Say we have a class `Person` which looks something like this:

We can create an instance of a `Person` like so:

As we build our application there are many scenarios in which we want to be able to compare different instances of a `Person` for equality such as in test expectations or in `Stream` transformations like `distinct`.

If you try to run the following code you’ll see that two instances of `Person` with the exact same name and age are not equal.

This is because by default, two objects are only equal if they are the exact same object ([Dart Documentation](https://www.dartlang.org/guides/language/effective-dart/design#equality)). In the above snippet, `bob` is a different object with a different `hashCode` and `identity` so when we compare `bob` with a new instance of a `Person` Dart will treat them as not equal.

In order to be able to compare different instances of a `Person` we would need to override the `==` operator (and consequently `hashCode`). As a result our `Person` class would look something like:

Now if we run the following code again:

print(bob == Person(name: “Bob”, age: 40)); // true

We are able to compare different instances of `Person`.

You can probably already see how this can quickly become a pain when dealing with complex classes. This is where [Equatable](https://pub.dartlang.org/packages/equatable) comes in! 🎉

[Equatable](https://pub.dartlang.org/packages/equatable) overrides `==` and `hashCode` for you so you don’t have to waste your time writing lots of boilerplate code.

There are other packages that will actually generate the boilerplate for you; however, you still have to run the code generation step which is not ideal.

With [Equatable](https://pub.dartlang.org/packages/equatable) there are no extra steps needed so we can focus more on writing amazing applications and save ourselves the headache of having to generate/write a ton of boilerplate code.

To use [Equatable](https://pub.dartlang.org/packages/equatable), we need to add it as a dependency to our `pubspec.yaml`

dependencies:  
  equatable: ^0.6.0

Then install it

# Dart

pub get# Flutter  
flutter packages get

and lastly extend `Equatable`

We significantly reduced the amount of boilerplate which is pretty awesome, and we didn’t have to deal with the complex overrides or code generation.

To see [Equatable](https://pub.dartlang.org/packages/equatable) in action, you can check out the [bloc package](https://github.com/felangel/bloc) examples (flutter_login or flutter_infinite_list) or checkout the articles for more details ([flutter login](https://medium.com/flutter-community/flutter-login-tutorial-with-flutter-bloc-ea606ef701ad), [flutter_infinite_list](https://medium.com/flutter-community/flutter-infinite-list-tutorial-with-flutter-bloc-2fc7a272ec67)).
