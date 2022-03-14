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

  //-----BOOT MATERIAL-----//
  static TextStyle textStyle({Color? color, double? size, TextAlign? align}){
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 20,
    );
  }

}