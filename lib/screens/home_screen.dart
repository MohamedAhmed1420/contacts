import 'package:contact_app/core/models/contact_model.dart';
import 'package:contact_app/core/utils/app_assets.dart';
import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/core/widgets/contact_card.dart';
import 'package:contact_app/core/widgets/contacts_bottom_sheet.dart';
import 'package:contact_app/core/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.darkBlue,
        title: SvgPicture.asset(AppImages.logo),
      ),
      body: contacts.isEmpty
          ? const EmptyWidget()
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: .64,
              ),
              itemBuilder: (context, index) {
                return ContactCard(
                  contact: contacts[index],
                  onPressed: () => _deleteContactByIndex(index),
                );
              },
              itemCount: contacts.length,
            ),

      floatingActionButton: Column(
        spacing: 8,
        mainAxisSize: .min,
        children: [
          if (contacts.isNotEmpty)
            FloatingActionButton(
              onPressed: () => _deleteLastContact(),
              backgroundColor: AppColors.red,
              foregroundColor: AppColors.white,
              child: const Icon(Icons.delete_rounded),
            ),

          if (contacts.length < 6)
            FloatingActionButton(
              onPressed: () => _openContactBottomSheet(),
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.darkBlue,
              child: const Icon(Icons.add_rounded),
            ),
        ],
      ),
    );
  }

  void _deleteLastContact() {
    contacts.removeLast();
    setState(() {});
  }

  void _deleteContactByIndex(int index) {
    contacts.removeAt(index);
    setState(() {});
  }

  void _openContactBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkBlue,
      isScrollControlled: true,

      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: ContactsBottomSheet(
          contacts: contacts,
          onCantactAdded: () => setState(() {}),
        ),
      ),
    );
  }
}
