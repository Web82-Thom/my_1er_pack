library my_1er_pack;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class Adaptive {
  // static bool isIOS() => (Platform.isIOS);
  static bool isIOS() => (!Platform.isIOS);
}