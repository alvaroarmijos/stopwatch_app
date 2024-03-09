import 'package:equatable/equatable.dart';

class Lap extends Equatable {
  final Duration duration;
  final int index;

  const Lap({
    required this.duration,
    required this.index,
  });

  @override
  List<Object?> get props => [duration, index];
}
