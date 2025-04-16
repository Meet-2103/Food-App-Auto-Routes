import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_auto_router/presentation/profile/bloc/profile_bloc.dart';
import 'package:food_app_auto_router/core/text_style_constants.dart';
import 'package:food_app_auto_router/core/text_constants.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isEditing = context.watch<ProfileBloc>().state.isEditing;

    final fields = [
      _FieldConfig(
        hint: TextConstants.nameHint,
        isPassword: false,
      ),
      _FieldConfig(
        hint: TextConstants.emailHint,
        isPassword: false,
      ),
      _FieldConfig(
        hint: TextConstants.addressHint,
        isPassword: false,
      ),
      _FieldConfig(
        hint: TextConstants.passwordHint,
        isPassword: true,
      ),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 30),
            ...fields.map(
                  (field) => _buildField(field.hint, isEditing, isPassword: field.isPassword),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String hint, bool isEditing, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        enabled: isEditing,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: isPassword ? const Icon(Icons.lock_outline) : null,
          hintStyle: TextStyleConstants.ratingRow,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        style: TextStyleConstants.productDescription,
      ),
    );
  }
}

class _FieldConfig {
  final String hint;
  final bool isPassword;
  _FieldConfig({required this.hint, this.isPassword = false});
}
