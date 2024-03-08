import 'package:flutter/material.dart';
import 'package:stopwatch_app/src/packages/core/ui/ui.dart';

class Time extends StatelessWidget {
  const Time({
    super.key,
    required this.time,
  });

  final String time;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
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
            width: 160,
            height: 160,
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
