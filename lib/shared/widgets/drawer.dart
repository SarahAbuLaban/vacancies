import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:un_vacancies/controllers/app.dart';
import 'package:un_vacancies/shared/config/colors.dart';
import 'package:un_vacancies/shared/config/text_style.dart';
import '../../views/web_view.dart';
import '../config/constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ['home', 'about_us', 'language'];

    void handleItemClick(final String item) {
      Get.back();
      switch (item) {
        case 'language':
          final toChange = Get.locale?.languageCode == 'ar' ? 'en' : 'ar';
          Get.find<AppController>(tag: 'app_controller')
              .changeLanguage(toChange);
          break;
        case 'about_us':
          Get.to(() => AppWebView(title: 'about_us'.tr, url: AppConstants.aboutUs,));
          break;
      }
    }

    return Drawer(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.kPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppConstants.appIcon,
              height: 200,
            ),
            const SizedBox(
              height: AppConstants.kPadding * 2,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () => handleItemClick(item),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/drawer/$item.png',
                                color: AppColors.kPrimary,
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(
                                width: AppConstants.kPadding,
                              ),
                              Text(
                                item.tr,
                                style: const BoldTextStyle(),
                              )
                            ],
                          ),
                        ),
                        if (index != items.length)
                          const SizedBox(
                            height: AppConstants.kPadding * 1.5,
                          )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
