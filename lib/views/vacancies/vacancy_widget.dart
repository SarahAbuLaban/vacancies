import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:un_vacancies/shared/config/text_style.dart';
import 'package:un_vacancies/shared/utils/text_utils.dart';
import 'package:un_vacancies/shared/widgets/app_button.dart';
import 'package:un_vacancies/views/vacancies/details.dart';
import '../../models/vacancy.dart';
import '../../shared/config/colors.dart';
import '../../shared/config/constants.dart';

class VacancyWidget extends StatelessWidget {
  final Vacancy vacancy;

  const VacancyWidget({super.key, required this.vacancy});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => VacancyDetails(vacancy: vacancy),
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(milliseconds: 500)),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: AppColors.kPrimary)),
        child: Column(
          children: [
            if (TextUtils.isEmpty(vacancy.image))
              Image.asset(AppConstants.appIcon,
                  height: 200, width: double.maxFinite)
            else
              Image.network(vacancy.image!,
                  height: 200, width: double.maxFinite),
            const SizedBox(
              height: AppConstants.kPadding,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppConstants.kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    vacancy.title,
                    style: const BoldTextStyle(
                        size: 24, textColor: AppColors.kPrimary),
                  )),
                  if (TextUtils.isNotEmpty(vacancy.company)) ...[
                    const SizedBox(
                      height: AppConstants.kPadding / 2,
                    ),
                    Text('${'company'.tr}: ', style: const BoldTextStyle()),
                    Text(
                      vacancy.company!,
                      style: const NormalTextStyle(),
                    )
                  ],
                  if (TextUtils.isNotEmpty(vacancy.description)) ...[
                    const SizedBox(
                      height: AppConstants.kPadding / 2,
                    ),
                    Text(
                      '${'description'.tr}: ',
                      style: const BoldTextStyle(),
                    ),
                    Text(
                      vacancy.description!,
                      style: const NormalTextStyle(),
                    )
                  ],
                  const SizedBox(height: AppConstants.kPadding / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IgnorePointer(
                        ignoring: true,
                        child: AppButton(
                          text: 'more'.tr,
                          suffix: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      if (TextUtils.isNotEmpty(vacancy.datePosted))
                        Text(vacancy.datePosted!,
                            style: const SmallTextStyle()),
                    ],
                  ),
                  const SizedBox(height: AppConstants.kPadding),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
