import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitaab/presentation/component/animation_effect.dart';
import 'package:kitaab/presentation/component/c_divider.dart';
import 'package:kitaab/presentation/component/custom_button.dart';
import 'package:kitaab/presentation/styles/theme.dart';
// import 'package:kitaab/presentation/pages/garage/car_wash/widgets/rate_container.dart';
import 'package:kitaab/presentation/styles/theme_wrapper.dart';

class CBottomsheetProfile extends StatefulWidget {
  final VoidCallback onTapBack;
  final VoidCallback onTapLogOut;
  const CBottomsheetProfile(
      {super.key, required this.onTapBack, required this.onTapLogOut});

  @override
  State<CBottomsheetProfile> createState() => _CBottomsheetProfileState();
}

class _CBottomsheetProfileState extends State<CBottomsheetProfile> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (ctx, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.only(
            top: 12.h, bottom: MediaQuery.of(context).padding.bottom + 8.h),
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          boxShadow: colors.shadowMM,
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32.w,
                height: 2.h,
                decoration: BoxDecoration(
                  color: colors.neutral500,
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              20.h.verticalSpace,
              CircleAvatar(
                  radius: 28.r,
                  backgroundColor: colors.primary50,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: icons.exitS.svg(
                        width: 24.w, height: 24.h, color: colors.primary500),
                  )),
              16.h.verticalSpace,
              Text("want_to_logout".tr(), style: fonts.headingH5SmallSemiBold),
              26.h.verticalSpace,
              const CDivider(padding: false),
              16.h.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Expanded(
                      child: AnimationButtonEffect(
                        onTap: widget.onTapBack,
                        child: Text(
                          "back_to".tr(),
                          style: fonts.footerRegular.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        horizontalPadding: 48,
                        isInfinityWidth: false,
                        onPressed: widget.onTapLogOut,
                        title: "log_out".tr(),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      );
    });
  }
}
