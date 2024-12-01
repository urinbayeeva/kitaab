import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitaab/presentation/styles/theme_wrapper.dart';

class DeadlineProgressBar extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  final String title;

  const DeadlineProgressBar({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.title,
  });

  @override
  State<DeadlineProgressBar> createState() => _DeadlineProgressBarState();
}

class _DeadlineProgressBarState extends State<DeadlineProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;
  late double _currentProgress;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _currentProgress = _calculateProgress();
    _progressAnimation =
        Tween<double>(begin: _currentProgress, end: _currentProgress).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  double _calculateProgress() {
    final currentDate = DateTime.now();

    if (currentDate.isBefore(widget.startDate)) {
      return 1.0;
    } else if (currentDate.isAfter(widget.endDate)) {
      return 0.0;
    } else {
      final totalDuration =
          widget.endDate.difference(widget.startDate).inSeconds;
      final remainingTime = widget.endDate.difference(currentDate).inSeconds;

      double progress = remainingTime / totalDuration;
      return progress.clamp(0.0, 1.0);
    }
  }

  void _updateProgress() {
    final newProgress = _calculateProgress();

    _progressAnimation =
        Tween<double>(begin: _currentProgress, end: newProgress).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addListener(() {
            setState(() {});
          });

    _controller.forward(from: 0);
    _currentProgress = newProgress;
  }

  @override
  void didUpdateWidget(covariant DeadlineProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.startDate != oldWidget.startDate ||
        widget.endDate != oldWidget.endDate) {
      _updateProgress();
    }
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: LinearProgressIndicator(
                value: _progressAnimation.value,
                minHeight: 8.r,
                backgroundColor: colors.neutral200,
                color: colors.primary500,
              ),
            ),
            8.h.verticalSpace,
            Text(
              widget.title,
              style:
                  fonts.paragraphP2Regular.copyWith(color: colors.neutral700),
            ),
          ],
        );
      },
    );
  }
}
