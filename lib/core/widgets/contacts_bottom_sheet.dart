import 'dart:io';

import 'package:contact_app/core/models/contact_model.dart';
import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/core/utils/app_validator.dart';
import 'package:contact_app/core/widgets/bottom_sheet_header.dart';
import 'package:contact_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ContactsBottomSheet extends StatefulWidget {
  final List<Contact> contacts;
  final void Function() onCantactAdded;
  const new({super.key, required this.contacts, required this.onCantactAdded});

  @override
  State<ContactsBottomSheet> createState() => _ContactsBottomSheetState();
}

class _ContactsBottomSheetState extends State<ContactsBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ValueNotifier<File?> pickedImage = ValueNotifier(null);
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetHeader(
            pickedImage: pickedImage,
            nameController: _nameController,
            emailController: _emailController,
            phoneController: _phoneController,
          ),
          Form(
            key: _formKey,
            child: Column(
              spacing: 8,
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  hintText: 'Enter User Name',
                  keyboardType: .name,
                  textInputAction: .next,
                  validator: AppValidator.nameValidator,
                ),

                CustomTextFormField(
                  controller: _emailController,
                  hintText: 'Enter User Email',
                  keyboardType: .emailAddress,
                  textInputAction: .next,
                  validator: AppValidator.emailValidator,
                ),

                CustomTextFormField(
                  controller: _phoneController,
                  hintText: 'Enter User Phone',
                  keyboardType: .phone,
                  textInputAction: .done,
                  validator: AppValidator.phoneValidator,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.contacts.add(
                  Contact(
                    image: pickedImage.value,
                    name: _nameController.text,
                    email: _emailController.text,
                    phone: _phoneController.text,
                  ),
                );

                widget.onCantactAdded();

                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.darkBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
              minimumSize: const Size.fromHeight(56),
            ),
            child: const Text(
              'Enter User',
              style: TextStyle(fontSize: 20, fontWeight: .normal),
            ),
          ),
        ],
      ),
    );
  }
}
