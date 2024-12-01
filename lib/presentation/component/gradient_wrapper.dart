import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitaab/presentation/styles/theme_wrapper.dart';

class GradientWrapper extends StatelessWidget {
  final Widget child;
  const GradientWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: colors.shadowS,
            gradient: const LinearGradient(
              colors: [Color(0xFFFDC448), Color(0xFF3827C7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: .6.h,
              horizontal: .6.w,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: colors.shade0,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFFDC448).withOpacity(.16),
                      const Color(0xFF3827C7).withOpacity(.16)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
