import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:kitaab/utils/constants.dart';

class DBService {
  static const _dbName = 'localDB';
  static const _accessToken = 'access_token';
  static const _uid = 'uid';
  static const _refreshToken = 'refresh_token';
  static const _themeMode = 'theme_mode';
  static const _language = 'language';
  static const _likesList = "likes_list";
  static const _changedPartList = "changed_part_list";
  static const _optionList = "option_list";
  static const _currencyAmount = "currency_amount";
  static const _currencySymbol = "currency_symbol";
  static const _starsList = "stars_list";
  static const _seenList = "seen_list";
  static const intro = 'intro';
  static const prediction = 'prediction';
  static const auction = 'auction';
  static const auctionMarket = 'auction_market';
  static const business = 'business';
  static const auctionTerms = 'auction_terms';
  static const auctionBusiness = 'auction_business';
  static const auctionConsumer = 'auction_consumer';
  static const diagnostics = 'diagnostics';
  static const _messageFaq = 'message_faq';

  static Box? _box;

  DBService._();

  static Future<DBService> get create async {
    _box ??= await Hive.openBox(_dbName);
    return DBService._();
  }

    Future<void> setThemeMode(String? mode) async {
    await _box?.put(_themeMode, mode);
  }

  String? get getThemeMode {
    String? getName = _box?.get(_themeMode);
    return getName;
  }

    bool? get getLang {
    bool? language = _box?.get(_language, defaultValue: false);

    return language;
  }

}
