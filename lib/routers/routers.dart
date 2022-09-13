import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/modules/login/bloc/login_bloc.dart';
import 'package:flutter_boilerplate/modules/login/views/login_screen.dart';
import 'package:flutter_boilerplate/modules/main/bloc/main_bloc.dart';
import 'package:flutter_boilerplate/modules/main/views/main_screen.dart';
import 'package:flutter_boilerplate/modules/profile/views/profile_screen.dart';
import 'package:flutter_boilerplate/modules/splash/views/splash_screen.dart';

import 'package:flutter_boilerplate/di/injector.dart';

class YPRouter {
  static Map<String, WidgetBuilder> routes = {
    SplashScreen.route: (context) => const SplashScreen(),
    LoginScreen.route: (context) => BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
              authenticationRepository:
                  Injector.instance.authenticationRepository),
          child: const LoginScreen(),
        ),
    MainScreen.route: (context) => const MainScreen(),
    ProfileScreen.route: (context) => const ProfileScreen(),
  };
}
