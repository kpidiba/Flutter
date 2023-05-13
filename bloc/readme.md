# BLOC TDD

# https://www.youtube.com/watch?v=THCkkQ-V1-8&list=PLptHs0ZDJKt_T-oNj_6Q98v-tBnVf-S_o&index=14 (flutter bloc best videos)

A ***B**usiness **Lo**gic **C**omponent **BLoC*** refers to the design pattern in computer programming. It is meant for a state management.

![](./Screenshot%202023-04-26%20105307.png)

- create folders requires

- define error,failure and exceptions

- start with domain

- go to data  (model>repository>datasource -local>remote)

create model,repositoryImpl,post_local_data_source,post_remote_data_source.

- connection Checker

- Presentation

Start with by bloc part

- Dependency injection container

- main.dart -> add injection page **di** and add **providers** .

- Make Page UI and integrate bloc

## CUBIT

Cubit is a subset of the BLoC Pattern package that does not rely on events and instead uses methods to emit new states.

So, we can use Cubit for simple states, and as needed we can use the Bloc.

****UPDATE** : additional comparison**

There are many advantages of choosing Cubit over Bloc. The two main benefits are:

**Cubit** is a subset of **Bloc**; so, it reduces complexity. Cubit eliminates the event classes. Cubit uses emit rather than yield to emit state. Since emit works synchronously, you can ensure that the state is updated in the next line.
