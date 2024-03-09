import 'package:equatable/equatable.dart';

class Lap extends Equatable {
  final Duration duration;
  final int index;

  const Lap({
    required this.duration,
    required this.index,
  });

  static const empty = Lap(
    duration: Duration(),
    index: 0,
  );

  @override
  List<Object?> get props => [duration, index];
}
