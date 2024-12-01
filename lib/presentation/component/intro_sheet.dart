import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitaab/infrastructure/services/analytics/analytics_service.dart';
import 'package:kitaab/presentation/component/animation_effect.dart';
import 'package:kitaab/presentation/component/custom_button.dart';
import 'package:kitaab/presentation/styles/style.dart';
import 'package:kitaab/presentation/styles/theme.dart';
import 'package:kitaab/presentation/styles/theme_wrapper.dart';

class IntroSheet extends StatefulWidget {
  final String title;
  final List<({Widget title, String label, String img})> data;
  final GestureTapCallback onDone;
  const IntroSheet({
    super.key,
    required this.data,
    required this.title,
    required this.onDone,
  });

  @override
  State<IntroSheet> createState() => _IntroSheetState();
}

class _IntroSheetState extends State<IntroSheet> {
  late int currentIndex;
  late PageController pageController;

  @override
  void initState() {
    currentIndex = 0;
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return SafeArea(
          top: false,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .74,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: widget.data.length,
                  onPageChanged: (value) {
                    currentIndex = value;
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    final item = widget.data[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 14.h),
                      child: Column(
                        children: [
                          item.img.svg(height: 314.h),
                          24.h.verticalSpace,
                          item.title,
                          16.h.verticalSpace,
                          Expanded(
                            child: Text(
                              semanticsLabel: item.label,
                              item.label,
                              style: fonts.paragraphP2Regular
                                  .copyWith(color: colors.neutral600),
                              maxLines: 6,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.data.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.decelerate,
                    width: currentIndex == index ? 24.h : 8.h,
                    height: 8.h,
                    margin: EdgeInsets.only(right: 4.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: currentIndex == index
                          ? colors.primary500
                          : colors.neutral200,
                    ),
                  ),
                ),
              ),
              24.h.verticalSpace,
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: AnimatedCrossFade(
                    firstChild: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AnimationButtonEffect(
                            onTap: () async {
                              await AnalyticsService().analyzeEvent(
                                name: "skip",
                                screenFrom: 'intro_prediction',
                                screenTo: 'prediction_flow',
                              );
                              widget.onDone();
                            },
                            child: Center(
                              child: Text(
                                semanticsLabel: "skip".tr(),
                                "skip".tr(),
                                style: Style.semiBold16(size: 16.sp),
                              ),
                            ),
                          ),
                        ),
                        16.w.horizontalSpace,
                        Expanded(
                          child: CustomButton(
                            verticalPadding: 14.h,
                            onPressed: () {
                              pageController.animateToPage(
                                ++currentIndex,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOutCubic,
                              );
                              setState(() {});
                            },
                            title: "next".tr(),
                          ),
                        ),
                      ],
                    ),
                    secondChild: Center(
                      child: CustomButton(
                        verticalPadding: 14.h,
                        isInfinityWidth: false,
                        horizontalPadding: 24.w,
                        onPressed: () async {
                          await AnalyticsService().analyzeEvent(
                            name: "prediction_auto",
                            screenFrom: 'intro_prediction',
                            screenTo: 'prediction_flow',
                          );
                          widget.onDone();
                        },
                        title: widget.title,
                      ),
                    ),
                    crossFadeState: currentIndex < widget.data.length - 1
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 600),
                    sizeCurve: Curves.easeInOutCubic,
                    firstCurve: Curves.easeInOutCubic,
                    secondCurve: Curves.easeInOutCubic,
                  ),
                ),
              ),
              8.h.verticalSpace,
            ],
          ),
        );
      },
    );
  }
}
