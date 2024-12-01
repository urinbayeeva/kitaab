import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitaab/infrastructure/services/analytics/analytics_service.dart';
import 'package:kitaab/presentation/pages/core/main/main_page.dart';
import 'package:kitaab/presentation/pages/core/no_connection.dart';

class AppRoutes {
  static PageRoute onGenerateRoute(
      {required BuildContext context,
      required bool notConnection,
      required bool isLang,
      Uri? initLink}) {
    ScreenUtil.init(context, designSize: const Size(390, 846));
    if (notConnection) {
      return getNetworkNotFound();
    }  else {
      return main();
    }
  }

  static MaterialPageRoute getNetworkNotFound() {
    AnalyticsService().analyzeScreenView('getNetworkNotFound');
    return MaterialPageRoute(
      builder: (_) => const NoConnection(),
    );
  }

  static MaterialPageRoute main({int? index}) =>
      MaterialPageRoute(builder: (_) {
        AnalyticsService().analyzeScreenView('main');
        return const MainPage();
        // child: const InsuranceStatusPage(),
      });


}
