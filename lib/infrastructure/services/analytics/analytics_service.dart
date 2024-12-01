import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static const String screenFrom = "screen_from";
  static const String screenTo = "screen_to";
  static const String button = "button";

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  void setAnalytics() {
    _analytics.setAnalyticsCollectionEnabled(true);
  }

  Future<void> analyzeEvent(
      {required String name,
      required String screenFrom,
      String? screenTo}) async {
    _analytics.logEvent(
      name: "screen_event",
      parameters: {
        'firebase_screen': {
          button: name,
          screenFrom: screenFrom,
          if (screenTo != null) screenTo: screenTo,
        },
      },
    );
  }

  void analyzeScreenView(String name) {
    _analytics.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': name,
        'firebase_screen_class': name,
      },
    );
  }
}
