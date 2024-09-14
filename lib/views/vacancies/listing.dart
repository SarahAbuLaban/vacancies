import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:un_vacancies/shared/widgets/custom_widgets.dart';
import 'package:un_vacancies/views/vacancies/vacancy_widget.dart';
import '../../controllers/vacancies.dart';
import '../../shared/config/constants.dart';
import '../../shared/widgets/drawer.dart';

import '../../shared/config/colors.dart';

class VacanciesListing extends StatefulWidget {
  const VacanciesListing({super.key});

  @override
  State<VacanciesListing> createState() => _VacanciesListingState();
}

class _VacanciesListingState extends State<VacanciesListing> {
  final _controller =
      Get.put(VacanciesController(), tag: 'vacancies_controller');

  @override
  void initState() {
    _controller.getAvailableVacancies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            key: AppConstants.scaffoldKey,
            appBar: CustomWidgets.appBar(),
            drawer: const AppDrawer(),
            body: RefreshIndicator(
              onRefresh: _controller.getAvailableVacancies,
              child: Obx(() {
                final loading = _controller.isLoading;
                 return ListView.builder(
                  itemCount: _controller.itemCount,
                  padding: const EdgeInsets.all(AppConstants.kPadding),
                  itemBuilder: (context, index) {
                    if (loading) {
                      return CustomWidgets.loader();
                    } else if (_controller.vacancies.isEmpty &&
                        !loading) {
                      return CustomWidgets.noDataFound();
                    }
                    final vacancy = _controller.vacancies[index];
                    return Column(
                      children: [
                        VacancyWidget(vacancy: vacancy),
                        if (vacancy != _controller.vacancies.last)
                          const SizedBox(
                            height: AppConstants.kPadding,
                          ),
                      ],
                    );
                  },
                );
              }),
            )),
      ),
    );
  }
}
