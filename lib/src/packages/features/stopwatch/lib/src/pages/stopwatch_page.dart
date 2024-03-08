import 'package:flutter/material.dart';
import 'package:stopwatch_app/src/packages/core/ui/ui.dart';

import '../widgets/time.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Time(
              time: '00:00',
            ),
            const SizedBox(
              height: AppDimens.dimen_20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('STOP'),
                ),
                const SizedBox(
                  width: AppDimens.dimen_24,
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('LAP'),
                ),
              ],
            ),
            const SizedBox(
              height: AppDimens.dimen_20,
            ),
          ],
        ),
      ),
    );
  }
}
