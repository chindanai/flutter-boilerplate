import 'package:flutter_boilerplate/modules/main/bloc/main_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_boilerplate/modules/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_boilerplate/modules/splash/views/splash_screen.dart';
import 'package:flutter_boilerplate/routers/routers.dart';
import 'package:flutter_boilerplate/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => AuthenticationBloc()),
        BlocProvider(create: (ctx) => MainBloc())
      ],
      child: MaterialApp(
        builder: EasyLoading.init(),
        initialRoute: SplashScreen.route,
        routes: YPRouter.routes,
        theme: AppTheme.themeData,
        title: 'Flutter Boilerplate',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
