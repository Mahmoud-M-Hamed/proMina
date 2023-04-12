import 'package:flutter/material.dart';
import 'package:promina/view_layers/login_view/login_view.dart';
import '../../view_layers/home_view/home_view.dart';

mixin NavigatePages{
  static void navigateToHomeActivity(context, {String? token}) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => HomeViewActivity(token: token),
    ),
  );

  static void navigateToLogInActivity(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) =>
      const LogInViewActivity(),
    ),
  );
}