import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:un_vacancies/shared/config/constants.dart';
import 'package:un_vacancies/shared/config/text_style.dart';
import 'package:un_vacancies/shared/widgets/app_button.dart';

class AppDialogs {
  static Future mainDialog(final String title, final String message) async {
    await Get.dialog(Dialog(
      insetPadding: const EdgeInsets.all(AppConstants.kPadding),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.kPadding / 2)),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const BoldTextStyle(),
              ),
            ),
            const SizedBox(
              height: AppConstants.kPadding,
            ),
            Text(
              message,
              style: const NormalTextStyle(),
            ),
            const SizedBox(
              height: AppConstants.kPadding * 2,
            ),
            Center(
              child: SizedBox(
                width: 100,
                child: AppButton(
                  text: 'okay'.tr,
                  onPressed: () => Get.back(),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
