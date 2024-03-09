import 'package:flutter/material.dart';
import 'package:stopwatch_app/src/packages/core/ui/ui.dart';

import '../../../../../core/utils/utils.dart';

class Time extends StatelessWidget {
  const Time({
    super.key,
    required this.duration,
  });

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    String twoDigitHours = twoDigits(duration.inHours);
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
    final time = "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.red,
                  AppColors.pink.withOpacity(0.46),
                ],
              ),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: theme.colorScheme.background,
              shape: BoxShape.circle,
            ),
          ),
          Text(
            time,
            style: textTheme.displayMedium?.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
