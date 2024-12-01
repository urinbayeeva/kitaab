import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitaab/presentation/styles/theme_wrapper.dart';

class CAdCard extends StatelessWidget {
  final String title;
  const CAdCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: 4.h,
            horizontal: 8.w,
          ),
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              width: 1.w,
              color: colors.neutral200,
            ),
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Abozor ",
                  style: TextStyle(color: colors.primary500),
                ),
                TextSpan(
                  semanticsLabel: title,
                  text: title,
                ),
              ],
              style: fonts.paragraphP2Regular,
            ),
          ),
        );
      },
    );
  }
}
