import 'package:bloc_demo/Models/user_model.dart';
import 'package:bloc_demo/Screens/main_screen.dart';
import 'package:bloc_demo/Screens/user_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainScreen());
      case '/user_detail':
        final user = settings.arguments as User;
        return MaterialPageRoute(builder: (_) => UserDetail(user: user));
      default:
        return null;
    }
  }
}
