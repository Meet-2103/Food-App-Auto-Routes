import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileStateChange> {
  ProfileBloc() : super(ProfileStateChange(isEditing: false)) {
    on<ToggleEditMode>((event, emit) {
      emit(state.copyWith(isEditing: !state.isEditing));
    });
  }
}
