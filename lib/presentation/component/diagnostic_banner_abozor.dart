import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitaab/presentation/styles/theme.dart';
import 'package:kitaab/presentation/styles/theme_wrapper.dart';
import 'dart:math' as math;

class DiagnosticBannerAbozor extends StatelessWidget {
  final bool isAbozorDiagnostic;

  const DiagnosticBannerAbozor({super.key, required this.isAbozorDiagnostic});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Positioned(
        top: -30,
        left: -22,
        child: Transform.rotate(
          alignment: Alignment.center,
          angle: -math.pi / 7,
          child: Container(
            color: colors.primary500,
            constraints: const BoxConstraints(
              minWidth: 100,
              maxWidth: 300,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isAbozorDiagnostic ? 24 : 10, vertical: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  2.h.verticalSpace,
                  Row(
                    children: [
                      if (!isAbozorDiagnostic)
                        Transform.rotate(
                            angle: -math.pi - 2.6,
                            child: icons.checkCircleS
                                .svg(width: 12.w, height: 12.h)),
                      4.w.horizontalSpace,
                      Text(
                        "diagnostics".tr(),
                        style:
                            fonts.footerSemiBold.copyWith(color: Colors.white),
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                  2.h.verticalSpace,
                  if (isAbozorDiagnostic)
                    Padding(
                      padding: const EdgeInsets.only(right: 180),
                      child: icons.logo
                          .svg(color: Colors.white, width: 12, height: 12),
                    ),
                  if (isAbozorDiagnostic) 4.h.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
