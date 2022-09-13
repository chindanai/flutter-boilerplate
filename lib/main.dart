import 'dart:async';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app.dart';
import 'package:flutter_boilerplate/configs/app_configs.dart';
import 'package:flutter_boilerplate/core/secure_storage/impl/secure_storage.dart';
import 'package:flutter_boilerplate/di/injector.dart';
import 'package:flutter_boilerplate/network/impl/network_impl.dart';

void main() {}

Future<void> handleError(Object error, StackTrace? stack) async {
  await FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
}

void run(Config config) async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    // await Firebase.initializeApp();
    // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    Injector.instance.setup(
      apiClient: NetworkImpl(
        Dio()
          ..options.baseUrl = config.baseURL
          ..options.connectTimeout = 60000
          ..options.receiveTimeout = 60000,
      ),
      secureStorage: SecureStorageImpl('flutter.boilerplate'),
    );

    FlutterError.onError = (FlutterErrorDetails details) async {
      await handleError(details.exception, details.stack);
    };

    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      await handleError(errorAndStacktrace.first, errorAndStacktrace.last);
    }).sendPort);

    runApp(
      EasyLocalization(
        path: config.localizationPath,
        supportedLocales: config.supportedLocales,
        fallbackLocale: config.fallbackLocale,
        child: const App(),
      ),
    );
  }, (Object error, StackTrace stack) async {
    await handleError(error, stack);
  });
}
