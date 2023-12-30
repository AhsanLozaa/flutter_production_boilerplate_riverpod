import 'package:equatable/equatable.dart';

class BottomNavBarState extends Equatable {
  const BottomNavBarState({
    this.index = 0,
  });

  final int index;
  BottomNavBarState copyWith({
    int? index,
  }) {
    return BottomNavBarState(index: index ?? this.index);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw [index];
}
