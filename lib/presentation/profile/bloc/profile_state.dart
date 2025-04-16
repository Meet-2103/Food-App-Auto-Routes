
import 'package:equatable/equatable.dart';

sealed class ProfileState extends Equatable{}

class ProfileStateChange extends ProfileState{
  final bool isEditing;

  ProfileStateChange({required this.isEditing});

  ProfileStateChange copyWith({bool? isEditing}) {
    return ProfileStateChange(isEditing: isEditing ?? this.isEditing);
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
