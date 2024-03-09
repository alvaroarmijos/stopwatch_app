import 'package:flutter/material.dart';
import 'package:stopwatch_app/src/packages/core/ui/ui.dart';

import '../../../../../core/utils/utils.dart';

class LapItem extends StatelessWidget {
  const LapItem({
    super.key,
    required this.index,
    required this.duration,
  });

  final int index;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    String twoDigitHours = twoDigits(duration.inHours);
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
    final time = "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.dimen_20),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: AppDimens.dimen_36),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.dimen_40)),
        tileColor: AppColors.primary,
        leading: LapText(
          value: '$index',
          label: 'Lap',
        ),
        trailing: LapText(
          value: time,
        ),
      ),
    );
  }
}

class LapText extends StatelessWidget {
  const LapText({
    super.key,
    required this.value,
    this.label = '',
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return RichText(
      text: TextSpan(
        text: value,
        style: textTheme.headlineMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: ' $label',
            style: textTheme.titleLarge?.copyWith(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
