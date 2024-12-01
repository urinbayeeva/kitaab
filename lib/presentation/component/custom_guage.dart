import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitaab/presentation/styles/theme.dart';
import 'package:kitaab/presentation/styles/theme_wrapper.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CustomGuage extends StatefulWidget {
  final double minimum;
  final double maximum;
  final double current;
  final double endWith;
  final double startWith;
  final double width;
  final double dividerWidth;
  final double thickness;

  const CustomGuage({
    super.key,
    this.minimum = 0,
    this.maximum = 12,
    required this.current,
    this.endWith = .32,
    this.startWith = .32,
    this.width = 32,
    this.dividerWidth = 40,
    this.thickness = .14,
  });

  @override
  State<CustomGuage> createState() => _CustomGuageState();
}

class _CustomGuageState extends State<CustomGuage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    _initialAnimation();
    super.initState();
  }

  _initialAnimation() {
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubicEmphasized,
    ).drive(Tween<double>(begin: widget.minimum, end: widget.current));

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant CustomGuage oldWidget) {
    _initialAnimation();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  startAngle: 180,
                  endAngle: 360,
                  minimum: widget.minimum,
                  maximum: widget.maximum,
                  showLabels: false,
                  showTicks: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: widget.thickness,
                    thicknessUnit: GaugeSizeUnit.factor,
                    color: Colors.grey.shade200,
                    cornerStyle: CornerStyle.bothCurve,
                  ),
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue:
                          _animation.value, // Animate this value with curve
                      gradient: SweepGradient(
                        colors: [
                          Colors.white,
                          colors.primary200,
                        ],
                        stops: const [0.0, 1.0],
                      ),
                      startWidth: widget.startWith,
                      endWidth: widget.endWith,
                      sizeUnit: GaugeSizeUnit.factor,
                    ),
                  ],
                  pointers: <GaugePointer>[
                    RangePointer(
                      width: widget.width,
                      value: _animation.value,
                      color: colors.primary500,
                      cornerStyle: CornerStyle.startCurve,
                    ),
                    WidgetPointer(
                      value: _animation.value,
                      offsetUnit: GaugeSizeUnit.factor,
                      offset: .8,
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          double rotationAngle =
                              (_animation.value / widget.maximum) * 180;
                          return Transform.rotate(
                            angle: rotationAngle * (3.141592653589793 / 180),
                            child: icons.arrowS.svg(
                              height: 18.r,
                              width: 18.r,
                            ),
                          );
                        },
                      ),
                    ),
                    WidgetPointer(
                      value: _animation.value,
                      offset: .8,
                      child: AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            double rotationAngle =
                                (_animation.value / widget.maximum) * 180;
                            return Transform.rotate(
                              angle: rotationAngle * (3.141592653589793 / 180),
                              child: Container(
                                height: 1.h,
                                color: colors.primary500,
                                width: widget.dividerWidth,
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
