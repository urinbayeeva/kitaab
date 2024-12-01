import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitaab/presentation/styles/theme_wrapper.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class CDecoratedBox extends StatelessWidget {
  final Widget child;
  final bool isOpen;
  const CDecoratedBox({super.key, required this.child, this.isOpen = false});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return AnimatedContainer(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: isOpen
                ? BorderRadius.vertical(
                    bottom: Radius.circular(24.r),
                  )
                : null,
            image: DecorationImage(
              image: svg.Svg(icons.netLarge),
              fit: BoxFit.cover,
            ),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF0F0F11),
                Color(0xFF313131),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
          child: child,
        );
      },
    );
  }
}
