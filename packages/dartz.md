# DARTZ

# EITHER Exception and error

Handling error exception

```dart
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_tutorial/user.dart';

class Repository {
  Future<Either<User, Failure>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(
          'https://60fec25a2574110017078789.mockapi.io/api/v1/users/1'));

      if (response.statusCode == 200) {
        return Left(User.fromJson(json.decode(response.body)));
      } else {
        return Right(Failure(message: 'Data gagal didapatkan.'));
      }
    } catch (e) {
      print(e);
      return Right(Failure(message: 'Data gagal didapatkn.'));
    }
  }
}


class Failure {
  String? message;
  Failure({this.message});
}
```

# Level Up Your Dart Code with Dartz

## How to eliminate nullable variables from your Flutter apps

One of the best upgrades to Dart was sound null safety. It greatly frees you up from having to worry about null pointer exceptions and allows you to focus on the business logic of your app. The notion that a variable has no value remains useful though; and hence nullable variables are still used.

To derive the maximum benefit out of null safety, you should minimize the use of nullable variables. In the following, we discuss some ways of doing that.

# Let’s Go

![](https://miro.medium.com/v2/resize:fit:500/1*w8DOjpXSBe4jIS0WDC3hHw.gif)

A common scenario in app development involves fetching data through an API before displaying it on the screen. For the duration of the fetch, a progress indicator is usually shown.

One way to do that is to have two variables. A boolean variable to indicate whether the data is being loaded and another nullable variable to store the data once it has been fetched. A minimal example might be as follows.

![](https://miro.medium.com/v2/resize:fit:875/1*o5imnYCmVI7AL0x10x8LtA.png)

This code can be improved. We can remove the isLoading variable and make the data variable null safe.

> In the build function we use the ! operator to assert that the data variable is not null. This is a guarantee given by the programmer to the compiler. If, however, at runtime the data variable in fact turns out to be null, the app will crash. In a simple example you might be able to see that it will work correctly because you can understand the whole code at once. As the code base grows it gets increasingly difficult to make sure that nullable variables will in fact not be null each time we use the ! operator.

The example above can be refactored by using the Option type provided in the [dartz](https://pub.dev/packages/dartz) package. The changes are in green.

![](https://miro.medium.com/v2/resize:fit:875/1*sDiyjynm9UocjbtOVRGqgQ.png)

Dartz helps us to program in a functional style. Familiarity with functional programming is not needed to follow this guide. However, the ways for assigning and accessing values to Option, Either and other types may seem strange at first before they become second nature. The aim here is to learn how to use the functional programming tools. We take a hands-on approach.

Let’s go through the above example in some detail. We made two changes to the variable which stores the fetched data. The type has changed from ***List<int>*** to ***Option<List<int>>***. We also changed the name to end with Option, which indicates the type. Changing the name is not necessary but it is a good convention to follow.

Loosely speaking, a variable that has the ***Option<T>*** type can either have no value or a value of type T which can be int, String or any custom type in your project.

In the above example, the value in dataOption can be either a list of integers or ‘nothing’ which corresponds to data being null in the first example.

The value of an Option variable can not be accessed directly. We use the fold method to access it. Using the fold method has the advantage that it forces us to handle both situations: when we do and do not have a value. In this way it is much harder to make mistakes or to miss edge cases.

Three commands are highlighted in green in the refactored example. The first declares the variable, the second assigns a value to it; and the third uses the fold function to build the UI. We will discuss all three of these steps now.

Option<List<int>> dataOption = none(); 

The declaration is self-explanatory. We assign none() to dataOption since we do not initially have the data.

Once the data is fetched, we assign ***some(fetchedData)*** to ***dataOption***. Notice that we can not assign the value directly as *dataOption = fetchedData.* When we want to store some value we do it through the ***some(value)*** function.

When building the UI, we use the fold function on *dataOption*.

![](https://miro.medium.com/v2/resize:fit:775/1*_ye-QEn5A4hH53x-qylxzw.png)

We provide two functions as arguments. Only one of these functions is executed depending on whether dataOption is *none* or *some*.

The first function will always have no parameters and will run only when dataOption has no value. In our case it returns the ui when the data has not yet been fetched.

If dataOption does have some value, it is passed as a parameter to the function which is the second argument to the fold function. In our example, we use the value to build the UI.

Great that you have followed this far. Though we can go further.

In real apps, it is always a possibility that the fetch operation might be unsuccessful. So far we have blissfully ignored that possibility in our example. Let’s address it.

If you really look at it, you need three pieces of information at any point in time:

1. Has the data been fetched?
2. Was the fetch successful?
3. If fetched successfully, what is the fetched data?

If we do it in the way of the first example we can use three variables: a boolean to store whether the fetch is in progress, another boolean to store whether the fetch was successful, and a third nullable variable to store the fetched data in event of a successful fetch. Then in the build function, we can conditionally render the ui.

In other words, there are three possible ‘states’:

1. Fetching
2. Failed fetch
3. Successful fetch

But what if we can use only one variable to hold all the three possible states. That could be cool, I bet.

![](https://miro.medium.com/v2/resize:fit:600/1*j1g9jeJGwqjE7024OR_VlQ.gif)

The refactor is as follows.

![](https://miro.medium.com/v2/resize:fit:875/1*YcXEQDifhtdA3EVWXD7TXw.png)

As can be seen in the highlighted changes above, we use the Either type provided by the Dartz package. Let us discuss the changes in more detail.

A variable that has the type ***Either<L, R>*** can either have a value of type L or a value of type R. In our case we specified Unit and List<int> as the possible types. Conventionally, we specify the failure type on the left and the success type on the right. Unit is a type that comes from dartz and can be used as a replacement for the kind of cases where null is usually used. Again we use the familiar fold method to access the value of an Either variable.

Just as we have ***none()*** and ***some()*** to assign values to Option types, we have ***left()*** and ***right()*** for Either. To assign a value of type L use ***left(value)*** and to assign a value of type R use ***right(value).***

Let’s look at the declaration again.

Option<Either<Unit, List<int>>> dataEO = none();

The dataEO variable can basically have three types. It can either be *none,* or if it is *some,* it can either be *left (Unit)* or *right*(*List<int>).* Each of these three types correspond to the three pieces of information we needed:

1. When dataEO is none it means the fetch is in not yet complete
2. When dataEO is *some(left(Unit))* it means the fetch was not successful.
3. When dataEO is *some(right(List<int>))* it means the fetch was successful.

Let’s see what we are doing in the build function.

![](https://miro.medium.com/v2/resize:fit:875/1*0Rk6y82mD7onxPxKAsyBVQ.png)

The fold on dataEO takes two functions. The first function returns the UI when the fetch is in progress. The second function gets one argument which has the type *Either<Unit, List<int>>*. We need to call fold again and specify the UI in the case of a failed and a successful fetch.

That’s it! Happy coding :)

# 2

# Dart and Functional Programming: applying Haskell concepts with dartz

[#flutter](https://dev.to/t/flutter)[#dart](https://dev.to/t/dart)[#functional](https://dev.to/t/functional)[#haskell](https://dev.to/t/haskell)

Haskell is a purely functional programming, with a lot of powerful features. In the other hand, Dart is a language focused on creating fast multiplatform apps.

But how could we bring some good features and concepts from Haskell into the Dart language? This is exactly what *dartz* tries to do.

## [](https://dev.to/juanbelieni/dart-and-functional-programming-applying-haskell-concepts-with-dartz-3d21#maybe-or-option)Maybe (or Option)

The first concept we will try to apply in Dart is `Maybe`, a data structure in Haskell that can hold `Nothing` or `Just <value>`. In Haskell, `Maybe` would be used in a context where the return value of a function will not necessarily be a meaningful value.

Example:  

```
classifyAge :: Int -> Maybe String
classifyAge age | age < 0   = Nothing
                | age < 13  = Just "Child"
                | age < 20  = Just "Teenager"
                | age < 65  = Just "Adult"
                | otherwise = Just "Elderly"
```

With *dartz*, we would use the `Option` type to have the same behavior:  

```
Option<String> classifyAge(int age) {
  if (age < 0) return none();
  if (age < 13) return some('Child');
  if (age < 18) return some('Teenager');
  if (age < 65) return some('Adult');
  return some('Elderly');
}
```

But why you would use such a type in Dart? Because mapping values and dealing with edge case turns to be much easier:  

```
classifyAge(12)
  .map((classification) => 'This person is a $classification')
  .getOrElse(() => 'Invalid age');

// This person is a Child
```

## [](https://dev.to/juanbelieni/dart-and-functional-programming-applying-haskell-concepts-with-dartz-3d21#either)Either

`Either` is another very important data structure in Haskell, because it can express two different types in terms of `Left` and `Right`.

Example:  

```
safeDiv :: Int -> Int -> Either String Int
safeDiv x y | y == 0    = Left "Division by zero"
            | otherwise = Right (x `div` y)
```

Here, we used `Either` to express a type of value that can be either an error or an actual return value.

In Dart, we can use this to handle cases like an API call, where the left value will be an error message (or the error object itself) and the right value will be the data fetched:  

```
Future<Either<String, Data>> getPost(int id) async {
  try {
    final response = await http.get('$url/$id');
    return right(response.data);
  } catch (e) {
    return left('Failed to fetch post');
  }
}

...

Widget build(BuildContext context) {
  return FutureBuilder<Either<String, Data>>(
    future: getPost(1),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return snapshot.data.fold(
          (error) => Text(error),
          (post) => Text('Post: ${post.title}'),
        );
      }

      return CircularProgressIndicator();
    },
  );
}
```

## [](https://dev.to/juanbelieni/dart-and-functional-programming-applying-haskell-concepts-with-dartz-3d21#traversable)Traversable

Let's build a simple function that returns the RNA transcription of a DNA, but when a character is invalid, it returns just the character.

In Haskell, we can build this using the `Traversable` data structure, that implements the `sequenceA` function:  

```
toRna :: String -> Either Char String
toRna dna = sequenceA $ map transcribe dna
 where
  dnaToRna = zip "GCTA" "CGAU"
  transcribe c = maybe (Left c) Right $ lookup c dnaToRna
```

In this case, `sequenceA` receives a list of `Either`s, and concatenate them in an `Either` of a list. But an interesting behavior of this function is that, when a `Left` value is found, it is returned immediately.

In Dart, we can do everything we did in Haskell, because *dartz* implements all the functions needed:  

```
Either<String, String> toRna(String dna) {
  final dnaToRna = IMap.fromIterables(
    ['G', 'C', 'T', 'A'],
    ['C', 'G', 'A', 'U'],
    StringOrder,
  );

  Either<String, String> transcribe(String c) => dnaToRna.get(c).fold(
        () => left(c),
        (n) => right(n),
      );

  final transcribedDna = IList.from(dna.split('')).map(transcribe);

  return IList.sequenceEither(transcribedDna).map(
    (dna) => dna.toList().join(''),
  );
}

...

print(toRNA('GCTA')); // Right(CGAU)
print(toRNA('CGAU')); // Left(U)
```
