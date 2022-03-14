library my_1er_pack;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class Adaptive {
  //-----CHECK PLATFORM-----//
  static bool isIOS() => (Platform.isIOS);
  // static bool isIOS() => (!Platform.isIOS);

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

  static Future alert({@required BuildContext? context, }) {
    return showDialog(context: context!, builder: (context){
      return isIOS() ? iOSErrorAlert(context: context): AndroidErrorAlert(context: context);
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

  static AndroidErrorAlert({@required BuildContext? context, }){
   return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          text(string: "Une erreur est apparue", color: Colors.red),
        ],
      ) ,
      actions: <Widget>[
        TextButton(
          onPressed: Navigator.of(context!).pop, 
          child: text(string: "Ok", color: Colors.orange),
        ),
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
  static iOSErrorAlert({@required BuildContext? context}){
    return CupertinoAlertDialog(
      content: Column(
        children: [
          text(string: "error", color: Colors.orange),
        ],
      ),
      actions: <Widget>[
        CupertinoButton(child: text(string: "ok"), onPressed: (){
          Navigator.of(context!).pop();
        })

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