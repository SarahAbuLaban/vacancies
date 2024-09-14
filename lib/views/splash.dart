import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../shared/config/constants.dart';
import 'vacancies/listing.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 2), () => Get.offAll(const VacanciesListing()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.kPadding * 2),
            child: Image.asset(AppConstants.appIcon),
          ),
        ),
      ),
    );
  }
}
