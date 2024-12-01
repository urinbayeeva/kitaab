import 'dart:async';
import 'dart:io' show Platform;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kitaab/presentation/pages/core/app_widget.dart';
import 'package:kitaab/presentation/pages/core/app_init.dart';
import 'package:kitaab/utils/app_config.dart';
import 'package:kitaab/utils/constants.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://c8dcda5a65e8de836c3748153d3c4707@o4508394216554496.ingest.us.sentry.io/4508394218258432';
        options.tracesSampleRate = 1.0;
        options.profilesSampleRate = 1.0;
      },
    );

    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      Sentry.captureException(details.exception, stackTrace: details.stack);
    };
    AppConfig.create(
      appName: Constants.appName,
      baseUrl: Constants.baseUrlP,
      primaryColor: Colors.yellow,
      flavor: Flavor.prod,
    );
    await AppInit.create;
    Locale defaultLocale = const Locale('uz', 'UZ');
    try {
      String languageCode = Platform.localeName.split('_')[0];
      if (languageCode == "ru") {
        defaultLocale = const Locale('ru', 'RU');
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    runApp(
      SentryWidget(
        child: EasyLocalization(
          supportedLocales: const [Locale('uz', 'UZ'), Locale('ru', 'RU')],
          path: 'assets/translation',
          startLocale: defaultLocale,
          fallbackLocale: const Locale('uz', 'UZ'),
          child: MyApp(
            dbService: AppInit.dbService!,
            connectivityX: AppInit.connectivityX!,
          ),
        ),
      ),
    );
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}
