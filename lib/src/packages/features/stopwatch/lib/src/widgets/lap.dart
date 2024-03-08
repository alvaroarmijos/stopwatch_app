import 'package:flutter/material.dart';
import 'package:stopwatch_app/src/packages/core/ui/ui.dart';

class Lap extends StatelessWidget {
  const Lap({
    super.key,
    required this.index,
    required this.time,
  });

  final int index;
  final double time;

  @override
  Widget build(BuildContext context) {
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
          value: time.toStringAsFixed(1),
          label: 's',
        ),
      ),
    );
  }
}

class LapText extends StatelessWidget {
  const LapText({
    super.key,
    required this.value,
    required this.label,
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
