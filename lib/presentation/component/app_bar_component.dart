import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitaab/presentation/component/animation_effect.dart';
import 'package:kitaab/presentation/styles/style.dart';

import '../styles/theme.dart';
import '../styles/theme_wrapper.dart';
import 'cached_image_component.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String iconPath;
  final String profilePicPath;
  final VoidCallback? onButtonPressed;
  final Color? iconColor;
  final bool? autoLeading;
  final Color? color;
  final bool? isBorder;
  final String? titleRich;

  const AppBarComponent({
    super.key,
    this.title = '',
    this.iconPath = '',
    this.onButtonPressed,
    this.iconColor,
    this.color,
    this.isBorder,
    this.autoLeading,
    this.profilePicPath = '',
    this.titleRich,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (BuildContext context, CustomColorSet colors, FontSet fonts,
          IconSet icons, controller) {
        return Container(
          height: titleRich != null
              ? (kToolbarHeight * 2) + 18
              : kToolbarHeight * 2,
          decoration: BoxDecoration(
            color: color ?? colors.transparent,
            border: Border(
              bottom: BorderSide(
                  color: isBorder ?? false
                      ? colors.neutral900
                      : colors.transparent),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: 16.w,
                top: MediaQuery.of(context).padding.top,
                right: 16.w),
            child: Row(
              children: [
                autoLeading ?? false
                    ? SizedBox(
                        height: profilePicPath.isNotEmpty ? 30.r : 0,
                        width: profilePicPath.isNotEmpty ? 30.r : 0,
                        child: profilePicPath.isNotEmpty
                            ? CachedImageComponent(
                                height: 30.r,
                                width: 30.r,
                                borderRadius: 6.r,
                                imageUrl: profilePicPath,
                              )
                            : null)
                    : AnimationButtonEffect(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: icons.backS
                            .svg(color: colors.shade100, height: 26.h),
                      ),
                const Spacer(),
                SizedBox(
                  width: 280.w,
                  child: titleRich != null
                      ? Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                semanticsLabel: title,
                                text: title,
                                style: Style.medium20(size: 18.sp),
                              ),
                              TextSpan(
                                semanticsLabel: titleRich,
                                text: titleRich,
                                style: Style.semiBold16(
                                    size: 18.sp, color: colors.primary500),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          semanticsLabel: title,
                          title,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          textWidthBasis: TextWidthBasis.longestLine,
                          maxLines: 1,
                          style: Style.semiBold16(
                              size: 18.sp, color: colors.neutral800),
                        ),
                ),
                const Spacer(),
                Row(
                  children: [
                    AnimationButtonEffect(
                      onTap: onButtonPressed ?? () {},
                      child: iconPath.isNotEmpty
                          ? SvgPicture.asset(iconPath,
                              colorFilter: ColorFilter.mode(
                                  iconColor ?? colors.primary500,
                                  BlendMode.srcIn))
                          : SizedBox(
                              width: 0.w,
                            ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(titleRich != null ? 80 : 60);
}
