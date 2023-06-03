# BLOC TDD

# https://www.youtube.com/watch?v=THCkkQ-V1-8&list=PLptHs0ZDJKt_T-oNj_6Q98v-tBnVf-S_o&index=14 (flutter bloc best videos)

Documentation: [Bloc State Management Library](https://bloclibrary.dev/#/fluttertodostutorial) 



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

# Flutter: BlocBuilder vs BlocConsumer vs BlocListener

# **BlocBuilder**

This is the easy one. This is used when we want to draw a **Widget** based on what is the current **State**. In the following example a new “text” gets drawn every time the state changes.

The
 builder is called only when the widget is created and when a rebuild 
exist and it returns true (for this example it only returns true when 
state = OrderCompleted)

- **buildWhen (Optional):** This is flag (true/false) indicates if the builder method should be 
  called or not, keep in mind that this is called only during a rebuild 
  process (explained at the bottom of the article). If this returns true 
  then builder is called, if returns false it is not called. If buildWhen 
  is not declared then the builder is always executed.
- **builder (Required):** This
   method is most important, this returns the widget that we want to draw 
  based on the current state. i.e. The state is “OrderCompleted” then it 
  returns “Text(‘Order Completed!’)”

# BlocListener

This
 is just a listener not a builder (like the above), that means that its 
job is keep listening for new changes in the state and not to return a 
widget. Each time the state changes to a new state this listener will 
receive a notification that the state has changed and then you can 
trigger an action (e.g. Send a notification, consume an endpoint, 
analytics, etc).

So
 what gets draw in the screen doesn’t depends of what we receive in the 
listener, i.e. it doesn’t depend of the actual state (OrdersState), it 
reacts depending of the state.

The listener is called only one time, and this is when a rebuild process is executed.

- **listenWhen (Optional):** This
   is flag (true/false) indicates if the listener method should be called 
  or not, keep in mind that this is called only during a rebuild process 
  (explained at the bottom of the article). If this returns true then 
  listener is called, if returns false it is not called. If listenWhen is 
  not declared then the listener is always executed.
- **listener:** This method is most important, it listens for new changes in the state 
  and execute actions based on the received state. For example: API 
  requests, call analytics stuff, etc.

# BlocConsumer

This
 is a mix between “BlocListener” and “BlocBuilder”. This is used when we
 want to draw something based on the current state and execute some 
actions depending on the new arriving states.

The methods “buildWhen” and “listenWhen” are optional.

The “build” does the same as in BlocBuilder and “listener” does the same as in “BlocListener”.
