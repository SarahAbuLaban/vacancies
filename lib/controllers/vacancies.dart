import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../shared/services/webservice/vacancies_service.dart';

import '../models/vacancy.dart';

class VacanciesController extends GetxController {
  final _vacancies = RxList<Vacancy>([]);
  final _loading = Rx<ConnectionState>(ConnectionState.done);
  final _itemCount = RxInt(1);

  Future<void> getAvailableVacancies({final bool isRefresh = false}) async {
    _itemCount(1);
    _loading(ConnectionState.waiting);
    final response = await VacanciesService().getVacancies();
    _loading(ConnectionState.done);
    _vacancies
      ..clear()
      ..addAll(response);
    if (_vacancies.isNotEmpty) {
      _itemCount(_vacancies.length);
    }
  }

  List<Vacancy> get vacancies => _vacancies;

  bool get isLoading => _loading.value == ConnectionState.waiting;

  int get itemCount => _itemCount.value;
}
