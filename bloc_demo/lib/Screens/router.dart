import 'package:bloc_demo/Models/user_model.dart';
import 'package:bloc_demo/Screens/main_screen.dart';
import 'package:bloc_demo/Screens/user_detail.dart';
import 'package:bloc_demo/cubit/post_cubit.dart';
import 'package:bloc_demo/cubit/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return mainScreen();

      case '/user_detail':
        final user = settings.arguments as User;
        return userDetail(user);
      default:
        return null;
    }
  }
}

MaterialPageRoute mainScreen() => MaterialPageRoute(
    builder: (_) => BlocProvider(
          create: (ctx) => UserCubit(),
          child: MainScreen(),
        ));

MaterialPageRoute userDetail(User user) => MaterialPageRoute(
    builder: (_) => BlocProvider(
          create: (_) => PostCubit(user: user),
          child: UserDetail(user: user),
        ));
