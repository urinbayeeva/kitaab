import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitaab/presentation/component/animation_effect.dart';
import 'package:kitaab/presentation/styles/theme_wrapper.dart';

class OnlineAssistantWidget extends StatefulWidget {
  final List<String> texts;
  final bool haveButton;
  final int? buttonContainerIndex;
  final VoidCallback? haveButtonOnTap;
  final bool? isFinished;
  final VoidCallback? onAnimationFinished;
  final Widget? buttonTitle;
  const OnlineAssistantWidget({
    super.key,
    required this.texts,
    this.haveButton = false,
    this.buttonContainerIndex,
    this.haveButtonOnTap,
    this.isFinished,
    this.onAnimationFinished,
    this.buttonTitle,
  });

  @override
  State<OnlineAssistantWidget> createState() => _OnlineAssistantWidgetState();
}

class _OnlineAssistantWidgetState extends State<OnlineAssistantWidget> {
  int _currentTextIndex = 0;

  late List<String> texts;
  late bool haveButton;
  late int? buttonContainerIndex;
  late VoidCallback? haveButtonOnTap;

  @override
  void initState() {
    texts = widget.texts;
    haveButton = widget.haveButton;
    buttonContainerIndex = widget.buttonContainerIndex;
    haveButtonOnTap = widget.haveButtonOnTap;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant OnlineAssistantWidget oldWidget) {
    setState(() {
      texts = widget.texts;
      haveButton = widget.haveButton;
      buttonContainerIndex = widget.buttonContainerIndex;
      haveButtonOnTap = widget.haveButtonOnTap;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (_, colors, fonts, icons, controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(texts.length, (index) {
          String text = texts[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (index == texts.length - 1)
                _buildAvatar(icons.alomatAvatar)
              else
                SizedBox(width: 40.w),
              SizedBox(width: 10.w),
              _buildTextContainer(text, index, fonts.paragraphP2Regular, colors)
            ],
          );
        }),
      );
    });
  }

  Widget _buildAvatar(String image) {
    return Container(
      height: 40.r,
      width: 40.r,
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
          shape: BoxShape.circle),
    );
  }

  Widget _buildTextContainer(String text, int index, TextStyle style, colors) {
    return ThemeWrapper(builder: (_, colors, fonts, icons, controller) {
      return Expanded(
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.w),
            margin: EdgeInsets.symmetric(vertical: 4.h),
            decoration: BoxDecoration(
              borderRadius: _getBorderRadius(index),
              color: colors.secondary50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (index == 0)
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: Text("alomat_online_assistant".tr(),
                        style: fonts.captionRegular
                            .copyWith(color: colors.secondary700)),
                  ),
                _buildAnimatedText(text, index, style),
                if (haveButton && buttonContainerIndex == index)
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: _buildButton(),
                  ),
              ],
            )),
      );
    });
  }

  Widget _buildAnimatedText(String text, int index, TextStyle style) {
    return ThemeWrapper(builder: (_, colors, fonts, icons, controller) {
      return DefaultTextStyle(
        style: style,
        child: Stack(
          children: [
            Text(
              text,
              style: style.copyWith(color: Colors.transparent),
            ),
            if (_currentTextIndex == index)
              AnimatedTextKit(
                pause: const Duration(milliseconds: 200),
                isRepeatingAnimation: false,
                animatedTexts: [
                  TyperAnimatedText(
                    text,
                    speed: const Duration(milliseconds: 20),
                  ),
                ],
                onFinished: () {
                  if (_currentTextIndex == index &&
                      _currentTextIndex < texts.length - 1) {
                    setState(() {
                      _currentTextIndex++;
                    });
                  } else if (_currentTextIndex == widget.texts.length - 1) {
                    if (widget.onAnimationFinished != null) {
                      widget.onAnimationFinished!();
                    }
                  }
                },
              )
            else
              _currentTextIndex >= index ? Text(text) : const SizedBox()
          ],
        ),
      );
    });
  }

  Widget _buildButton() {
    return ThemeWrapper(builder: (_, colors, fonts, icons, controller) {
      return AnimationButtonEffect(
        onTap: haveButtonOnTap,
        child: Container(
          height: 40.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: Border.all(width: 1, color: colors.neutral700),
          ),
          child: Center(
            child: widget.buttonTitle!,
          ),
        ),
      );
    });
  }

  BorderRadius _getBorderRadius(int index) {
    if (texts.length == 1) {
      return BorderRadius.only(
        topLeft: Radius.circular(10.r),
        topRight: Radius.circular(10.r),
        bottomLeft: Radius.circular(1.r),
        bottomRight: Radius.circular(10.r),
      );
    } else if (index == 0) {
      return BorderRadius.only(
        topLeft: Radius.circular(10.r),
        topRight: Radius.circular(10.r),
        bottomLeft: Radius.circular(1.r),
        bottomRight: Radius.circular(1.r),
      );
    } else if (index == 1) {
      return BorderRadius.only(
        topLeft: Radius.circular(1.r),
        topRight: Radius.circular(1.r),
        bottomLeft: Radius.circular(2.r),
        bottomRight: Radius.circular(2.r),
      );
    } else if (index == texts.length - 1) {
      return BorderRadius.only(
        topLeft: Radius.circular(1.r),
        topRight: Radius.circular(1.r),
        bottomLeft: Radius.circular(1.r),
        bottomRight: Radius.circular(10.r),
      );
    } else {
      return BorderRadius.circular(2.r);
    }
  }
}
