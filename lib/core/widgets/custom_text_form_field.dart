import 'package:contact_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final String hintText;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.textInputAction,
    this.validator,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      autovalidateMode: .onUserInteractionIfError,
      controller: controller,
      cursorColor: AppColors.gold,
      cursorRadius: Radius.circular(16),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: .normal,
        color: AppColors.gold,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: .normal,
          color: AppColors.lightBlue,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.gold, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.gold, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.gold, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.red, width: 1),
        ),
      ),
    );
  }
}
