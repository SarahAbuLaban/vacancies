import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:un_vacancies/shared/config/text_style.dart';
import '../../shared/config/constants.dart';
import '../../shared/utils/text_utils.dart';
import '../../shared/widgets/custom_widgets.dart';
import '../../models/vacancy.dart';

class VacancyDetails extends StatelessWidget {
  final Vacancy vacancy;

  const VacancyDetails({super.key, required this.vacancy});

  @override
  Widget build(BuildContext context) {
    Widget information({required final String title,required  final String value}){
      return Column(
        children: [
          Row(children: [
            Expanded(child: Text('$title:',style: const BoldTextStyle(),)),
            Expanded(flex: 3,child: Text(value,style: const NormalTextStyle(),),)
          ],),
          const SizedBox(height: AppConstants.kPadding/2)
        ],
      );
    }

    return Scaffold(
      appBar: CustomWidgets.appBar(title: vacancy.title),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (TextUtils.isNotEmpty(vacancy.image)) ...[
              Image.network(
                vacancy.image!,
                height: 200,
                width: double.maxFinite,
              ),
              const SizedBox(height: AppConstants.kPadding*2,)
            ],
            information(title: 'job_id'.tr, value: vacancy.jobID),
            information(title: 'title'.tr, value: vacancy.title),
            if(TextUtils.isNotEmpty(vacancy.company))
              information(title: 'company'.tr, value: vacancy.company!),
            if(TextUtils.isNotEmpty(vacancy.location))
              information(title: 'location'.tr, value: vacancy.location!),
            if(TextUtils.isNotEmpty(vacancy.salary))
              information(title: 'salary'.tr, value: vacancy.salary!),
            if(TextUtils.isNotEmpty(vacancy.datePosted))
              information(title: 'date_posted'.tr, value: vacancy.datePosted!),
            if(TextUtils.isNotEmpty(vacancy.description))...[
              Text('${'description'.tr}:',style: const BoldTextStyle(),),
              Text(vacancy.description!,style: const NormalTextStyle(),)
            ],
            if(TextUtils.isNotEmpty(vacancy.longDescription))...[
              const SizedBox(height: AppConstants.kPadding/2),
              Text('${'long_description'.tr}:',style: const BoldTextStyle(),),
              Text(vacancy.longDescription!,style: const NormalTextStyle(),)
            ],

          ],
        ),
      ),
    );
  }
}
