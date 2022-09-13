import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/configs/app_configs.dart';
import 'package:flutter_boilerplate/main.dart';

void main() {
  run(
    const Config(
      baseURL: 'https://www.yoursite.com/api/v1',
      supportedLocales: [
        Locale('en', ''),
        Locale('th', ''),
      ],
      fallbackLocale: Locale('en', ''),
    ),
  );
}
