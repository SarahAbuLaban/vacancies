import 'dart:convert';

import 'package:un_vacancies/models/vacancy.dart';

import 'index.dart';

class VacanciesService extends NetworkRequests {
  Future<List<Vacancy>> getVacancies() async {
    final response = await getRequest(path: 'jobs/api');
    final jsonResponse = decodeResponse(response);
    if(jsonResponse == null) {
      return [];
    }
    if (jsonResponse is List) {
      return List<Vacancy>.from(jsonResponse.map((e) => Vacancy.fromJson(e)));
    } else {
      return [];
    }
  }
}
