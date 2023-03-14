# LEARNING

- **every layout without have child widget**

- **Everything in flutter is almost widget**

### ADD DEPENDENCY

```dart
pub add dependency
flutter clean
flutter pub get
```

### WIDGETS

- **MaterialApp** : represent whole application

```dart
-   debugShowCheckedModeBanner: false,//enlever le debug en haut
```

- **AppBar**

- **Scaffold**

- **TextSpan**

- **Text**

### TWO TYPES OF WIDGETS

- **DISPLAY WIDGET** (Text,TextSpan,Text.rich,Image/Icon,Button,Chip,Badges,Alert,SnakeBar)

- **LAYOUT WIDGET** (Center,Container,Row,Column,Table,Stack,Positioned,Padding/Margin,ListView,Expanded,Positioned)

### STATELESS WIDGET

A stateless widget never changes. Icon , IconButton , and Text are examples of stateless widgets

Le StatelessWidget est une classe (un widget) qui sert à créer une interface utilisateur. Comme son nom l’indique, elle n’a pas vocation à voir son état évoluer dans le temps.

### ORGNIZE APPLICATION

- **STATELESSMaterialApp > Scaffold > Widgets**

- **Create Folder : Screens to add Screen in** 

### CORE WIDGETS

- **Image** :pubspec.yaml, uncomment assets and add images

```dart
-Asset: const Image(image: AssetImage("images/image.png"),height: 100,width: 100,));
  }
-Network: Image(image:NetWorkImage("url"));
```

- **ICONS** : Material Icons(Default), FontAwesome Icons(dependency required)    

```dart
pub add font_awesome_flutter
- IconButton(
            iconSize: 80,
            color: Colors.yellow,
            icon:
                const Icon(Icons.phone_outlined),
            onPressed: () {
              print("hello");
            }, 
          ),


- FontAwesomeIcons.user
```

- **CONTAINER:** contains multiple widgets ,use padding,margin ,shadow on it
  - don't use color and boxDecoration same time

```dart
Container(
          width: 350.0,
          height: 250.0,
          margin: const EdgeInsets.all(50.0),
          padding: const EdgeInsets.all(20.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue, width: 6.0),
              color: Colors.blue,
              // borderRadius: const BorderRadius.all(Radius.circular(10.0),),
              shape: BoxShape.circle,
              image:
                  const DecorationImage(image: AssetImage("images/image.png")),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade900,
                    blurRadius: 7,
                    spreadRadius: 5,
                    offset: const Offset(4, 4))
              ]),
          // child: const Text(
          //   "TESTING",
          //   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          // ),
        )
```

- **ELEVATED BUTTON** :
  
  - **use this backgroundColor: Colors.yellow,** instead of **primary (Deprecated)**
  
  - **foregroundColor: Colors.black,** instead of **onPrimary**

```dart
//simple
ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 100),
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
              textStyle:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              //NOTE: shadow
              elevation: 15,
              shadowColor: Colors.blue,
              // NOTE:border
              side: const BorderSide(color: Colors.red, width: 10),
              alignment: Alignment.center,
              shape: const OvalBorder()),
          child: const Icon(Icons.ac_unit),
        ),


//icon
ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              padding:const EdgeInsets.all(20),
              fixedSize: const Size(300, 70),
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
              textStyle:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              //NOTE: shadow
              elevation: 15,
              shadowColor: Colors.blue,
              // NOTE:border
              side: const BorderSide(color: Colors.red, width: 10),
              alignment: Alignment.center,
              shape: const StadiumBorder()),
          icon: const Icon(Icons.ac_unit),
          label: const Text("Man with a mission"),
        ),




```

- **Other Buttons: TextButton,OutlineButton**

![](./differences.png)



- **AppBAR**

```dart
AppBar(
          leading: const Icon(Icons.menu_book),
          title: const Text("Menu Book"),
          backgroundColor: Colors.purple,
          flexibleSpace:  const Image(image:  NetworkImage("https://miro.medium.com/v2/resize:fit:1400/format:webp/0*vQwPKDYJVQr0dEKm.jpeg"),fit: BoxFit.cover,),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.abc,
                  size: 35,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 35,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.leaderboard,
                  size: 35,
                ))
          ],
        ),
```
