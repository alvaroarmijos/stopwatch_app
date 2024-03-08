import 'package:flutter/material.dart';
import 'package:stopwatch_app/src/packages/core/ui/ui.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/lib/src/widgets/widgets.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: theme.colorScheme.background,
            padding: const EdgeInsets.symmetric(vertical: AppDimens.dimen_20),
            child: const SafeArea(
              child: Time(
                time: '00:00',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(AppDimens.dimen_20),
              itemCount: 10,
              itemBuilder: (context, index) => const Lap(
                index: 1,
                time: 1.1,
              ),
            ),
          ),
          Container(
            color: theme.colorScheme.background,
            padding: const EdgeInsets.symmetric(vertical: AppDimens.dimen_20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(Icons.stop),
                ),
                FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(Icons.play_arrow),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
