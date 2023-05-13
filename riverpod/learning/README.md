# RIVERPOD

Provider est **un package Dart au-dessus du widget InheritedWidget**. Il va vous permettre de propager des données dans votre application. L'avantage d'utiliser Provider est que vous aurez moins de code à écrire.Passer des variables a plusieurs widget de l' application.

Riverpod est **une bibliothèque de gestion d'états pour Flutter**. La "gestion d'états", ou "state management" en anglais, a pour responsabilité de mettre à disposition les différents objets qui constituent l'état de l'application. La principale particularité de Flutter est que tout est widget.

Providers are maybe the most important part of Riverpod. Everything you do with Riverpod is based somehow on a provider. That’s why it’s very important to understand what a provider is. As everything in Dart, and so in Riverpod, it’s an object which encapsulates a piece of state but also allows one to listen to that state and access it. There are many advantages in wrapping a piece of state in a provider:

- Allows you to easily access that state in multiple locations — Providers in Riverpod are fully Flutter-independent
- Very easy to combine multiple states
- Great performance optimizations — Only what is impacted by a state is recomputed
- Great testability — No complex setUp/tearDown steps and can be overridden in tests
- Easy integration with advanced features (logging, pull-to-refresh)

### Different types of providers

There are different types of providers that you can use in different cases. I want to explain them as short as possible. If you want to read more about the specific provider, I will provide a link to a more detailed explanation.

## [Provider](https://riverpod.dev/docs/providers/provider/) (readonly)

The provider is the most basic way of all providers.

It’s used for:

- cache computations
- expose a value to other providers
- offer a way for tests or widgets to override value
- reduce rebuilds of providers/widgets without having to use `select`

## [StateNotifierProvider](https://riverpod.dev/docs/providers/state_notifier_provider/)

StateNotifierProvider is used to listen to and expose a StateNotifier (from package [state_notifier](https://pub.dev/packages/state_notifier))

It’s used for:

- Expose an immutable state that can change over time after reacting to custom events
- Centralize the logic for modifying some states in a single place, improving maintainability over time

## [FutureProvider](https://riverpod.dev/docs/providers/future_provider/)

The equivalent of Provider, but for asynchronous code

It’s used for:

- perform and cache asynchronous operations
- nicely handle error/loading of asynchronous operations
- combine multiple asynchronous values into another value

You can see, that it’s used for the same things as a provider, but everything for asynchronous code.

## [StreamProvider](https://riverpod.dev/docs/providers/stream_provider/)

Similar to FutureProvider, but for Streams instead of Futures

It’s used for:

- Listen to firebase or web-sockets
- Rebuild another provider every few seconds/minutes etc.

## [StateProvider](https://riverpod.dev/docs/providers/state_provider/) (mutable):respond to state change

A simplification of StateNotifierProvider that exposes a way to modify its state. It was designed to avoid having to write a StateNotifier class for simple use cases. That’s why it’s often one of the following:

- enum (e.g. filter type)
- String (e.g. raw content of a text field)
- boolean (e.g. for checkboxes)
- number (e.g. pagination or age form fields)

Don’t use for:

- Your state needs validation logic
- a state is a complex object (custom class, list/map, …)
- logic for modifying state is more advanced than simple count++
