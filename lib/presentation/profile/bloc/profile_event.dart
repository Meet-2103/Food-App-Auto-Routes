import 'package:equatable/equatable.dart';

sealed class ProfileEvent extends Equatable{}

class ToggleEditMode extends ProfileEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
