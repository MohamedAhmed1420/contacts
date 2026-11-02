import 'package:contact_app/core/models/contact_model.dart';
import 'package:contact_app/core/utils/app_assets.dart';
import 'package:contact_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final VoidCallback onPressed;
  const new({super.key, required this.contact, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: .antiAlias,
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                contact.image == null
                    ? Positioned.fill(
                        child: Image.asset(AppImages.emptyImage, fit: .cover),
                      )
                    : Positioned.fill(
                        child: Image.file(contact.image!, fit: .cover),
                      ),

                Align(
                  alignment: .bottomStart,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.gold,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      contact.name,
                      style: const TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 14,
                        fontWeight: .w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 4,
              children: [
                Row(
                  spacing: 4,
                  children: [
                    const Icon(Icons.email, color: AppColors.darkBlue),
                    Text(
                      contact.email,
                      style: const TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 11,
                        fontWeight: .w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 4,
                  children: [
                    const Icon(Icons.phone_rounded, color: AppColors.darkBlue),
                    Text(
                      '+2${contact.phone}',
                      style: const TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 11,
                        fontWeight: .w500,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                  ),
                  child: Row(
                    spacing: 4,
                    mainAxisAlignment: .center,
                    children: [
                      const Icon(Icons.delete_rounded),
                      Text(
                        'Delete',
                        style: const TextStyle(fontSize: 11, fontWeight: .w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
