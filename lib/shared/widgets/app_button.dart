import 'package:flutter/material.dart';
import 'package:un_vacancies/shared/config/constants.dart';
import 'package:un_vacancies/shared/utils/text_utils.dart';
import '../config/colors.dart';
import '../config/text_style.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? suffix;

  const AppButton(
      {super.key, required this.text, this.onPressed, this.suffix});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!.call();
        }
      },
      child: Container(
        color: AppColors.kPrimary,
        padding: const EdgeInsets.all(AppConstants.kPadding / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const BoldTextStyle(textColor: Colors.white),
            ),
            if (suffix != null) ...[
              const SizedBox(
                width: AppConstants.kPadding / 2,
              ),
              suffix!
            ]
          ],
        ),
      ),
    );
  }
}
