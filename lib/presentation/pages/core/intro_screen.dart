import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitaab/infrastructure/services/local_database/db_service.dart';
import 'package:kitaab/presentation/component/animation_effect.dart';
import 'package:kitaab/presentation/component/custom_button.dart';
import 'package:kitaab/presentation/styles/style.dart';
import 'package:kitaab/presentation/styles/theme.dart';
import 'package:kitaab/presentation/styles/theme_wrapper.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Style.dark,
      child: ThemeWrapper(
        builder: (context, colors, fonts, icons, controller) {
          return Scaffold(
              backgroundColor: colors.neutral50, body: Placeholder());
        },
      ),
    );
  }
}
