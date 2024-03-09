import 'package:flutter/material.dart';

const keyIcon1 = 'icon1';
const keyIcon2 = 'icon2';

class SWAnimatedIcon extends StatelessWidget {
  const SWAnimatedIcon({
    super.key,
    required this.status,
    this.initialIcon = Icons.play_arrow,
    this.endIcon = Icons.pause,
  });

  final bool status;
  final IconData initialIcon;
  final IconData endIcon;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      transitionBuilder: (child, anim) => RotationTransition(
        turns: Tween<double>(begin: 0.75, end: 1).animate(anim),
        child: ScaleTransition(
          scale: anim,
          child: child,
        ),
      ),
      child: status
          ? Icon(endIcon, key: const ValueKey(keyIcon1))
          : Icon(
              initialIcon,
              key: const ValueKey(keyIcon2),
            ),
    );
  }
}
