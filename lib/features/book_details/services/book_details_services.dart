import 'dart:convert';

import 'package:flutter_tech_task/core/service_manager/service_manager.dart';
import 'package:flutter_tech_task/core/service_manager/status_code_enum.dart';
import 'package:http/http.dart' as http;

class BookDetailsServices extends ServiceManager {
  @override
  Future<T?> getModalFunc<T>({
    required String apiUrl,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final url = Uri.parse(apiUrl);
      final response = await http.get(url);

      if (response.statusCode == StatusCodeEnum.success.statusCode) {
        return fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
