import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Style {
  Style._();

  // NEUTRAL.
  static const Color neutral50 = Color(0xFFF7F6F6);
  static const Color neutral100 = Color(0xFFF3F2F2);
  static const Color neutral200 = Color(0xFFEBE9E9);
  static const Color neutral300 = Color(0xFFD6D3D3);
  static const Color neutral400 = Color(0xFFC7C2C2);
  static const Color neutral500 = Color(0xFFB4ADAD);
  static const Color neutral600 = Color(0xFF8A8686);
  static const Color neutral700 = Color(0xFF5A5858);
  static const Color neutral800 = Color(0xFF373535);
  static const Color neutral900 = Color(0xFF171616);

  static const Color primary50 = Color(0xFFFEEAE7);
  static const Color primary100 = Color(0xFFFCD6CF);
  static const Color primary200 = Color(0xFFF8B7AB);
  static const Color primary300 = Color(0xFFED8E7E);
  static const Color primary400 = Color(0xFFDF6354);
  static const Color primary500 = Color(0xFFCE2F2B);
  static const Color primary600 = Color(0xFFA02924);
  static const Color primary700 = Color(0xFF7E241F);
  static const Color primary800 = Color(0xFF541D17);
  static const Color primary900 = Color(0xFF1C0C07);

  static const Color secondary50 = Color(0xFFEEFAFA);
  static const Color secondary100 = Color(0xFFDCF5F4);
  static const Color secondary200 = Color(0xFFC1EDED);
  static const Color secondary300 = Color(0xFFA4E4E5);
  static const Color secondary400 = Color(0xFF7AD9DB);
  static const Color secondary500 = Color(0xFF2CCCCE);
  static const Color secondary600 = Color(0xFF287B7D);
  static const Color secondary700 = Color(0xFF235B5C);
  static const Color secondary800 = Color(0xFF1A3434);
  static const Color secondary900 = Color(0xFF101919);

  static const Color success50 = Color(0xFFECFDF5);
  static const Color success100 = Color(0xFFD1FAE5);
  static const Color success200 = Color(0xFFA7F3D0);
  static const Color success300 = Color(0xFF6EE7B7);
  static const Color success400 = Color(0xFF34D399);
  static const Color success500 = Color(0xFF10B981);
  static const Color success600 = Color(0xFF059669);
  static const Color success700 = Color(0xFF047857);
  static const Color success800 = Color(0xFF065F46);
  static const Color success900 = Color(0xFF064E3B);

  static const Color warning50 = Color(0xFFFFFBEB);
  static const Color warning100 = Color(0xFFFEF3C7);
  static const Color warning200 = Color(0xFFFDE68A);
  static const Color warning300 = Color(0xFFFCD34D);
  static const Color warning400 = Color(0xFFFBBF24);
  static const Color warning500 = Color(0xFFF59E0B);
  static const Color warning600 = Color(0xFFD97706);
  static const Color warning700 = Color(0xFFB45309);
  static const Color warning800 = Color(0xFF92400E);
  static const Color warning900 = Color(0xFF78350F);

  static const Color error50 = Color(0xFFFEF2F2);
  static const Color error100 = Color(0xFFFEE2E2);
  static const Color error200 = Color(0xFFFECACA);
  static const Color error300 = Color(0xFFFCA5A5);
  static const Color error400 = Color(0xFFF87171);
  static const Color error500 = Color(0xFFEF4444);
  static const Color error600 = Color(0xFFDC2626);
  static const Color error700 = Color(0xFFB91C1C);
  static const Color error800 = Color(0xFF991B1B);
  static const Color error900 = Color(0xFF7F1D1D);

  static const Color shade100 = Color(0xFF000000);
  static const Color shade0 = Color(0xFFFFFFFF);

  static const Color darkMode50 = Color(0xFF3D3E48);
  static const Color darkMode100 = Color(0xFF3A3B45);
  static const Color darkMode200 = Color(0xFF393944);
  static const Color darkMode300 = Color(0xFF343540);
  static const Color darkMode400 = Color(0xFF31323D);
  static const Color darkMode500 = Color(0xFF2D2E39);
  static const Color darkMode600 = Color(0xFF2A2B36);
  static const Color darkMode700 = Color(0xFF282934);
  static const Color darkMode800 = Color(0xFF242530);
  static const Color darkMode900 = Color(0xFF181925);
  static const Color transparent = Colors.transparent;

  static const LinearGradient grey = LinearGradient(
    colors: [
      Color(0xFF313131),
      Color(0xFF1F1F20),
    ],
    begin: Alignment(.99, 1.1),
    end: Alignment(.02, -.1),
  );

  static const LinearGradient red = LinearGradient(
    colors: [
      Color(0xFFCE2F2B),
      Color(0xFFA02924),
    ],
    begin: Alignment(.97, .03),
    end: Alignment(.06, .98),
  );

  static const LinearGradient texture = LinearGradient(
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFF1C0C07),
    ],
    begin: Alignment(.57, 0),
    end: Alignment(.57, 1.87),
  );

  static const BoxShadow blueIconShadow = BoxShadow(
    color: Color(0x20696A6F),
    blurRadius: 12,
    spreadRadius: 2,
  );

  static const BoxShadow bottomShadow = BoxShadow(
    color: Color(0x20696A6F),
    blurRadius: 4,
    spreadRadius: 2,
    offset: Offset(0.0, 4.0),
  );

  static TextStyle regular24({double size = 24, Color color = primary900}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w400,
      fontFamily: 'NunitoSans',
    );
  }

  static const List<BoxShadow> shadowS = [
    BoxShadow(
      offset: Offset(0, 6.43),
      blurRadius: 33.56,
      spreadRadius: 0,
      color: Color(0x12141415),
    ),
  ];

  static const List<BoxShadow> shadowSSSS = [
    BoxShadow(
      offset: Offset(0, 0.97),
      blurRadius: 5.04,
      spreadRadius: 0,
      color: Color(0x03141415),
    ),
    BoxShadow(
      offset: Offset(0, 2.67),
      blurRadius: 13.94,
      spreadRadius: 0,
      color: Color(0x03141415),
    ),
    BoxShadow(
      offset: Offset(0, 6.43),
      blurRadius: 33.56,
      spreadRadius: 0,
      color: Color(0x02141415),
    ),
    BoxShadow(
      offset: Offset(0, 18.95),
      blurRadius: 100,
      spreadRadius: 0,
      color: Color(0x01141415),
    ),
  ];

  static const List<BoxShadow> shadowM = [
    BoxShadow(
      offset: Offset(0, .97),
      blurRadius: 5.04,
      spreadRadius: 0,
      color: Color(0x08141415),
    ),
    BoxShadow(
      offset: Offset(0, 2.67),
      blurRadius: 13.94,
      spreadRadius: 0,
      color: Color(0x12141415),
    ),
  ];

  static const List<BoxShadow> shadowMM = [
    BoxShadow(
      offset: Offset(0, .97),
      blurRadius: 5.04,
      spreadRadius: 0,
      color: Color(0x08141415),
    ),
    BoxShadow(
      offset: Offset(0, 2.67),
      blurRadius: 13.94,
      spreadRadius: 0,
      color: Color(0x06141415),
    ),
  ];

  static const List<BoxShadow> shadowMMMM = [
    BoxShadow(
      offset: Offset(0, .97),
      blurRadius: 5.04,
      spreadRadius: 0,
      color: Color(0x08141415),
    ),
    BoxShadow(
      offset: Offset(0, 2.67),
      blurRadius: 13.94,
      spreadRadius: 0,
      color: Color(0x06141415),
    ),
    BoxShadow(
      offset: Offset(0, 6.43),
      blurRadius: 33.56,
      spreadRadius: 0,
      color: Color(0x04141415),
    ),
    BoxShadow(
      offset: Offset(0, 18.95),
      blurRadius: 111.32,
      spreadRadius: 0,
      color: Color(0x03141415),
    ),
  ];

  static TextStyle regular16({double size = 16, Color color = primary900}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w400,
      fontFamily: 'NunitoSans',
      letterSpacing: -0.24,
    );
  }

  static TextStyle regular14({double size = 14, Color color = primary900}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w400,
      letterSpacing: -0.24,
    );
  }

  static TextStyle regular12({double size = 12, Color color = primary900}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w400,
      fontFamily: 'NunitoSans',
      letterSpacing: -0.24,
    );
  }

  static TextStyle medium20({double size = 20, Color color = primary900}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w500,
      fontFamily: 'NunitoSans',
      letterSpacing: -0.24,
    );
  }

  static TextStyle medium16({double size = 16, Color color = primary900}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w500,
      fontFamily: 'NunitoSans',
      letterSpacing: -0.24,
    );
  }

  static TextStyle medium14({double size = 14, Color color = primary900}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w500,
      fontFamily: 'NunitoSans',
      letterSpacing: -0.24,
    );
  }

  static TextStyle semiBold16({double size = 16, Color color = primary900}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w600,
      fontFamily: 'NunitoSans',
      letterSpacing: -0.84,
      height: 1.1,
    );
  }

  static TextStyle semiBold14({double size = 14, Color color = primary900}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w600,
      fontFamily: 'NunitoSans',
      letterSpacing: -0.24,
    );
  }

  static TextStyle bold20({double size = 20, Color color = primary900}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w700,
      fontFamily: 'NunitoSans',
      letterSpacing: -0.24,
    );
  }

  static TextStyle bold16({double size = 16, Color color = primary900}) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w700,
      fontFamily: 'NunitoSans',
      letterSpacing: -0.24,
    );
  }

  static const SystemUiOverlayStyle light = SystemUiOverlayStyle(
    systemNavigationBarColor: shade0,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );

  /// System overlays should be drawn with a dark color. Intended for
  /// applications with a light background.
  static const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
    systemNavigationBarColor: shade0,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );
}
