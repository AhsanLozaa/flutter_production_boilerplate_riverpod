import 'package:equatable/equatable.dart';
import 'package:rive/rive.dart';

class GlassContainerState extends Equatable {
  const GlassContainerState({
    required this.filledValue,
  });

  final double filledValue;

  GlassContainerState copyWith({
    double? filledValue,
  }) {
    return GlassContainerState(filledValue: filledValue ?? this.filledValue);
  }

  @override
  List<Object?> get props => [filledValue];
}
