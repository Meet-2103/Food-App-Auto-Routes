import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_auto_router/presentation/profile/bloc/profile_bloc.dart';
import 'package:food_app_auto_router/presentation/profile/bloc/profile_event.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/core/text_style_constants.dart';
import 'package:food_app_auto_router/core/text_constants.dart';
import 'profile_form.dart';


class ProfileContentCard extends StatelessWidget {
  const ProfileContentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProfileBloc>().state;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 121),
        height: MediaQuery.of(context).size.height*0.8,
        decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 70),
            Expanded(child: const ProfileForm()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.read<ProfileBloc>().add(ToggleEditMode());
                      },
                      icon: const Icon(Icons.edit),
                      label: Text(
                        state.isEditing
                            ? TextConstants.save
                            : TextConstants.editProfile,
                        style: TextStyleConstants.orderNowButton,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.white,
                        foregroundColor: ColorConstants.white,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Add logout logic here
                      },
                      icon: const Icon(Icons.logout, color: ColorConstants.red),
                      label: Text(
                        TextConstants.logout,
                        style: TextStyleConstants.logoutButton,
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: ColorConstants.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        minimumSize: const Size.fromHeight(50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
