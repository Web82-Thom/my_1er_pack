# Adaptive ThomDev

Adapation à la plateform utilisé android ou ios.
Ce package est destiné à la création d'apllication [Flutter](https://flutter.io)

![ScreenShot](/screenshots/android.png)

![ScreenShot](/screenshots/ios.png)

## Getting Started

Pour utilisé ce package, ajouter au 'pubspec.yam' :

``` yaml
dependencies:
    adaptive_thom_dev:^1.0.2
```
## Usage

Dans le fichier Dart, importez:

``` dart
import: 'package:package:adaptive_thom_dev/adaptive_thom_dev.dart';
```

Intégrer un Scaffold


``` dart
@override
  Widget build(BuildContext context) {
    return Adaptive.scaffold(
      string: "Switch Android/IOS",
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Adaptive.text(string: "Android et ios", color: Colors.green),
            Adaptive.button(child: Adaptive.text(string: "Press me", color: Colors.red), 
            onPressed: (){
              Adaptive.alert(context: context, callback: (){
                Navigator.of(context).pop();
              });
            })
          ],
        ),
      )
    );
  }
```


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
