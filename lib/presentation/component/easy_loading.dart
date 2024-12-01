import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:kitaab/presentation/component/animation_effect.dart';
import 'package:kitaab/presentation/component/custom_button.dart';
import 'package:kitaab/presentation/styles/theme.dart';
import 'package:kitaab/presentation/styles/theme_wrapper.dart';

class EasyLoading {
  static Future<void> show({
    String? status,
  }) async {
    await SmartDialog.dismiss();
    SmartDialog.showLoading(
        msg: status ?? "loading".tr(), backType: SmartBackType.block);
  }

  static Future<void> showWidget({
    required Widget Function(BuildContext context) builder,
  }) async {
    await SmartDialog.dismiss();
    await SmartDialog.show(
        builder: builder,
        alignment: Alignment.topCenter,
        backType: SmartBackType.block);
  }

  static Future<void> dismiss() async {
    SmartDialog.dismiss();
  }

  static Future<void> showToast(String status,
      {Widget? widget, Duration? duration}) async {
    SmartDialog.showToast(status,
        alignment: Alignment.topCenter,
        displayTime: duration,
        builder: widget != null
            ? (BuildContext context) {
                return widget;
              }
            : null);
  }

  static Future<void> showError(String status,
      {String? description, VoidCallback? retry}) async {
    await SmartDialog.dismiss();
    await SmartDialog.show(
        keepSingle: true,
        builder: (_) {
          return ThemeWrapper(
              builder: (context, colors, fonts, icons, controller) {
            return AlertDialog(
              backgroundColor: colors.shade0,
              surfaceTintColor: colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(16.0.r),
              )),
              contentPadding: EdgeInsets.zero,
              iconPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimationButtonEffect(
                    onTap: () {
                      SmartDialog.dismiss();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.only(top: 16.h, right: 16.w, left: 16.w),
                      color: Colors.transparent,
                      child: icons.crossSquareO.svg(
                        color: colors.neutral500,
                        height: 24.r,
                      ),
                    ),
                  ),
                ],
              ),
              content: SizedBox(
                width: 1.sw - 32.w,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      icons.emojiSadD.svg(height: 48.h, width: 48.w),
                      16.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: status.contains("html>")
                            ? Center(child: HtmlWidget(status))
                            : Text(
                                status,
                                textAlign: TextAlign.center,
                                style: fonts.paragraphP2SemiBold,
                              ),
                      ),
                      if (description != null)
                        Column(children: [
                          4.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              semanticsLabel: description,
                              description,
                              textAlign: TextAlign.center,
                              style: fonts.paragraphP2Regular.copyWith(
                                  color: colors.neutral700.withOpacity(0.5)),
                            ),
                          ),
                        ]),
                      if (retry != null)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: CustomOutlinedButton(
                              horizontalPadding: 16.w,
                              borderColor: colors.neutral200,
                              onPressed: retry,
                              title: "restart".tr()),
                        ),
                      36.verticalSpace,
                    ]),
              ),
            );
          });
        });
  }

  static Future<void> showSuccess(String? status, {String? description}) async {
    await SmartDialog.dismiss();
    if (status != null) {
      await SmartDialog.show(
        builder: (_) {
          return ThemeWrapper(
            builder: (context, colors, fonts, icons, controller) {
              return AlertDialog(
                backgroundColor: colors.shade0,
                surfaceTintColor: colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(15.0.r),
                )),
                contentPadding: EdgeInsets.zero,
                iconPadding: EdgeInsets.zero,
                insetPadding: EdgeInsets.zero,
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimationButtonEffect(
                      onTap: () {
                        SmartDialog.dismiss();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: Colors.transparent,
                        child: icons.checkS.svg(
                          color: colors.shade0,
                          height: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                content: SizedBox(
                  width: 1.sw - 32.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                          color: colors.success500,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: icons.checkS.svg(
                          color: colors.shade0,
                          height: 36.h,
                        ),
                      ),
                      16.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          semanticsLabel: status,
                          status,
                          textAlign: TextAlign.center,
                          style: fonts.headingH6SmallSemiBold
                              .copyWith(fontSize: 18.sp),
                        ),
                      ),
                      if (description != null)
                        Column(
                          children: [
                            4.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(
                                semanticsLabel: description,
                                description,
                                textAlign: TextAlign.center,
                                style: fonts.paragraphP2Regular.copyWith(
                                    color: colors.neutral700.withOpacity(0.5)),
                              ),
                            ),
                          ],
                        ),
                      36.verticalSpace,
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    }
  }
}
