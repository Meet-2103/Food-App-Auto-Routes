import 'package:flutter/material.dart';
import 'package:food_app_auto_router/core/color_constants.dart';
import 'package:food_app_auto_router/core/text_constants.dart';
import 'package:food_app_auto_router/core/text_style_constants.dart';


class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorConstants.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: ColorConstants.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color:ColorConstants.red,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: ColorConstants.white,
                  size: 40,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                TextConstants.successTitle,
                style: TextStyleConstants.successTitle,
              ),
              const SizedBox(height: 12),
              Text(
                TextConstants.successMessage,
                textAlign: TextAlign.center,
                style: TextStyleConstants.successMessage,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);        //use auto routes
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.red,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    TextConstants.goBack,
                    style: TextStyleConstants.buttonText,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
