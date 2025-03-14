import 'dart:convert';

import 'package:flutter_tech_task/core/service_manager/status_code_enum.dart';
import 'package:http/http.dart' as http;

class MainPageServices {
  Future<T?> getBookList<T>({
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

  // Future<List<T>> getBookList<T>({required String apiUrl, required T Function(Map<String, dynamic>) fromJson}) async {
  //   final url = Uri.parse(apiUrl);
  //   final response = await http.get(url);

  //   if (response.statusCode == StatusCodeEnum.success.statusCode) {
  //     final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

  //     if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
  //       final List<dynamic> jsonList = jsonResponse['data'];
  //       return jsonList.map((jsonItem) => fromJson(jsonItem as Map<String, dynamic>)).toList();
  //     } else {
  //       throw Exception('Beklenen formatta veri alınamadı.');
  //     }
  //   } else {
  //     throw Exception('API çağrısı başarısız oldu: ${response.statusCode}');
  //   }
  // }
}
