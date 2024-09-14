import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:un_vacancies/shared/config/text_style.dart';

import '../config/colors.dart';
import '../config/constants.dart';
import '../utils/text_utils.dart';

class CustomWidgets {
  static AppBar appBar({final String? title}) {
    return AppBar(
        automaticallyImplyLeading: TextUtils.isNotEmpty(title),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation:AppConstants.kElevation,
        title: Row(
          children: [
            if(TextUtils.isEmpty(title))
              GestureDetector(
                onTap: () => AppConstants.scaffoldKey.currentState?.openDrawer(),
                child: const Icon(
                  Icons.menu,
                  color: AppColors.kPrimary,
                ),
              ),
            Expanded(
              child: Builder(builder: (context) {
                if (TextUtils.isEmpty(title)) {
                  return Image.asset(
                    AppConstants.appIcon,
                    width: 50,
                    height: 50,
                  );
                }
                return Text(title!,
                  style: const BoldTextStyle(
                      size: 20, textColor: AppColors.kPrimary));
              },),
            ),
          ],
        ));
  }

  static Widget loader(){
    return SizedBox(
      height: Get.height/1.3,
      child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.kPrimary,
          )),
    );
  }

  static Widget noDataFound(){
    return SizedBox(
      height: Get.height/1.3,
      child: Center(
        child: Text('no_data_found'.tr,style: const BoldTextStyle(size: 20),),
      ),
    );
  }
}