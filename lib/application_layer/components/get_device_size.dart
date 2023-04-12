
import 'package:flutter/material.dart';

mixin GetDeviceSize{
  static getDeviceWidth(context) => MediaQuery.of(context).size.width;
  static getDeviceHeight(context) => MediaQuery.of(context).size.height;
}