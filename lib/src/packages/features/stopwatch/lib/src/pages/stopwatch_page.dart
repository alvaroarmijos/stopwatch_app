import 'package:flutter/material.dart';

import '../widgets/time.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Time(
              time: '00:00',
            ),
          ],
        ),
      ),
    );
  }
}
