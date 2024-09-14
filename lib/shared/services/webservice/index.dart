import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:un_vacancies/shared/widgets/app_dialogs.dart';
import '../../config/constants.dart';

abstract class NetworkRequests {
  static final _client = http.Client();

  Future<http.Response?> getRequest(
      {required final String path,
      final Map<String, dynamic>? queryParameters}) async {
    try {
      return await _client.get(generateUri(path, queryParameters));
    } on SocketException catch (e) {
      AppDialogs.mainDialog('no_internet'.tr, 'please_reconnect'.tr);
      return null;
    } catch (e) {
      rethrow;
    }
  }

  dynamic decodeResponse(final http.Response? response) {
    try {
      if (response == null) {
        return;
      }
      if (response.statusCode != 200) {
        AppDialogs.mainDialog('sorry'.tr, 'sth_went_wrong'.tr);
        return null;
      }
      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  Uri generateUri(
      final String path, final Map<String, dynamic>? queryParameters) {
    return Uri(
        host: AppConstants.baseUrl,
        scheme: 'https',
        path: path,
        queryParameters: queryParameters);
  }
}
