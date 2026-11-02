import 'package:contact_app/core/utils/app_assets.dart';
import 'package:contact_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [
        LottieBuilder.asset(AppAnimations.emptyList),
        Text(
          'There is No Contacts Added Here',
          style: TextStyle(
            fontSize: 20,
            fontWeight: .w500,
            color: AppColors.gold,
          ),
        ),
      ],
    );
  }
}
