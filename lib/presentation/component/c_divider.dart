import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitaab/presentation/styles/theme_wrapper.dart';

class CDivider extends StatelessWidget {
  final bool padding;
  const CDivider({super.key, this.padding = true});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: padding ? 16.h : 0),
          child: Divider(height: 0, color: colors.neutral100, thickness: 1.6.h),
        );
      },
    );
  }
}
