// ignore_for_file: library_private_types_in_public_api
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:kitaab/infrastructure/core/interceptors.dart';
import 'package:kitaab/infrastructure/services/alice/alice.dart';
import 'package:kitaab/infrastructure/services/alice/model/alice_configuration.dart';
import 'package:kitaab/infrastructure/services/analytics/analytics_service.dart';
import 'package:kitaab/infrastructure/services/local_database/db_service.dart';
import 'package:kitaab/presentation/routes/routes.dart';
import 'package:kitaab/presentation/styles/theme.dart';
import 'package:kitaab/utils/app_config.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final AliceChopperAdapter aliceChopperAdapter = AliceChopperAdapter();
Alice alice = Alice(
  configuration: AliceConfiguration(
    showNotification: true,
    showInspectorOnShake: false,
  ),
)..addAdapter(aliceChopperAdapter);

class MyApp extends StatelessWidget {
  final DBService dbService;
  final bool connectivityX;
  final Function(BuildContext context)? onGetContext;

  const MyApp({
    super.key,
    required this.dbService,
    required this.connectivityX,
    this.onGetContext,
  });

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => GlobalController.create(dbService)),
        ChangeNotifierProvider(create: (_) => BottomNavBarController.create()),
        Provider<DBService>(create: (_) => dbService),
      ],
     
          child: MaterialApp(
            navigatorKey: alice.getNavigatorKey(),
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              child = FlutterSmartDialog.init()(context, child);
              return FlavorBanner(
                child: child,
              );
            },
            navigatorObservers: [
              FlutterSmartDialog.observer,
              AnalyticsService().getAnalyticsObserver(),
              SentryNavigatorObserver(),
            ],
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            onGenerateRoute: (_) {
              if (onGetContext != null) {
                onGetContext!(context);
              }
              return AppRoutes.onGenerateRoute(
                  context: context,
                  notConnection: !connectivityX,
                  isLang: dbService.getLang ?? true);
            },
          ),
        
    
    );
  }
}

class FlavorBanner extends StatelessWidget {
  final Widget child;

  const FlavorBanner({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (AppConfig.shared.flavor == Flavor.prod) {
      return child;
    }

    return Stack(
      children: [
        child,
        _buildBanner(context),
      ],
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Banner(
      message: AppConfig.shared.flavor.name,
      location: BannerLocation.topStart,
    );
  }
}
