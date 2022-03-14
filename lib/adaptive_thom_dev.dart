library adaptive_thom_dev;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class Adaptive {
  //-----CHECK PLATFORM-----//
  // static bool isIOS() => (Platform.isIOS);
  static bool isIOS() => (!Platform.isIOS);

  //-----MATERIAL DESIGN ADAPTED-----//
  static Widget scaffold({@required String? string, @required Widget? body}){
    return (isIOS()) ? iOSSScaffold(string!, body!) : androidScaffold(string!, body!);
  }

  static text({@required String? string, @required Color? color, double? size, TextAlign? align}){
    TextStyle style = textStyle(color: color, size: size);
    return (isIOS())
    ? iOSText(string: string, style: style, align: align)
    : androidText(string: string, style: style);
  }

  static button({@required Widget? child, @required VoidCallback? onPressed }) {
    return (isIOS() ? iOSButton(child: child, onPressed: onPressed): androidTextButton(child: child, onPressed: onPressed));
  }

  static Future alert({@required BuildContext? context, @required VoidCallback? callback}) {
    return showDialog(context: context!, builder: (context){
      return isIOS() ? iOSErrorAlert(context: context, onPressed: callback): AndroidErrorAlert(context: context, onPressed: callback);
    });
  }

  //-----ANDROID MATERIAL-----//
  static Scaffold androidScaffold(String string, Widget body){
    return Scaffold(
      appBar: AppBar(title: Text(string)),
      body: body,
    );
  }

  static Text androidText({@required String? string, @required TextStyle? style}){
    return Text(
      string!,
      style: style!,
    );
  }

  static TextButton androidTextButton({@required Widget? child, @required VoidCallback? onPressed}){
    return TextButton(onPressed: onPressed, child: child!);
  }

  static AndroidErrorAlert({@required BuildContext? context, @required VoidCallback? onPressed }){
   return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          text(string: "Une erreur est apparue", color: Colors.red),
        ],
      ) ,
      actions: <Widget>[
        button(
          child: 
          text(string: "OK"), 
          onPressed: onPressed
        )
      ],
    );
  }

  //-----IOS MATERIAL-----//
  static CupertinoPageScaffold iOSSScaffold(String string, Widget body){
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(string),),
      child: body,
    );
  }
  static DefaultTextStyle iOSText({@required String? string, @required TextStyle? style, @required TextAlign? align}) {
    return DefaultTextStyle(
      child: Text(string!, textAlign: align ?? TextAlign.left,),
      style: style!,
    );
  }

  static CupertinoButton iOSButton({@required Widget? child, @required VoidCallback? onPressed}){
    return CupertinoButton(child: child!, onPressed: onPressed!);
  }

  static iOSErrorAlert({@required BuildContext? context,@required VoidCallback? onPressed}){
    return CupertinoAlertDialog(
      content: Column(
        children: [
          text(string: "error", color: Colors.orange),
        ],
      ),
      actions: <Widget>[
        button(child: text(string: "OK"), onPressed: onPressed)

      ],
    );
  }

  //-----BOOT MATERIAL-----//
  static TextStyle textStyle({Color? color, double? size, TextAlign? align}){
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 20,
    );
  }

}