import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  static const String appName = "Kitaab";
  static const String appNameDev = "Kitaab Dev";
  static const String appNameBeta = "Kitaab Test";
  static const String awsRegion = "us-east-1";
  static const String awsBucketName = "kitaab";
  static const String baseUrlP = "https://motors.itpoint.uz";
  static const String baseUrlCarFilters = "https://elastic.itpoint.uz";
  static const String baseUrlDiagnostics =
      "https://files-api.itpoint.uz/orient-motors";
  static const String baseUrlImageUpload = "http://185.100.54.28:8014";
  static const String baseUrlChat = "http://185.100.54.28:8004";
  static const String webSocketUrl = "ws://185.100.54.28:8004";
  static const String privacyPolicyUrl = "https://avision.uz/agreement/";
  static const String contactWithUsUrl = "https://t.me/appfeedbacks_bot/";
  static const String supportUrl = "https://t.me/abozor_support/";
  static const String callToUs = "+998555559999";
  static const String diagnostic = "https://cabinet.itpoint.uz";
  static const String buildDate = "21.08.2024";
  static const String websiteUrl = "https://a-bozor.uz";
  static const String c2bAuctionUrlPath = "/webview/c2b-auction";
  static const String c2bAuctionRulesUrl = "/info-auction";
  static const String c2bAuctionUserUrl = "/webview/c2b-lending";
  static const String c2bDiagnosticUrl = "/diagnostics-lending-app";

  static String addLanguageUrl(String path) =>
      "$websiteUrl/${"app_lang".tr()}$path";
}
