import 'package:burgerking_apitest/Service/DataModels/charktermode_class.dart';
import 'package:burgerking_apitest/Service/Setup/data_layer_setup.dart';
import 'package:dio/dio.dart';
import 'package:flutter_svg/svg.dart';


import 'package:dio/dio.dart';

class BaseApi {
  final String defaultUri = "https://thronesapi.com";
  late final Dio dio;

  BaseApi() {
    var options = BaseOptions(
      baseUrl: defaultUri,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    dio = Dio(options);
  }

  Future<Map<String, dynamic>> post(String path, {dynamic data}) async {
    final response = await dio.post(path, data: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    }
    throw Exception("Failed to post data with statusCode: ${response.statusCode}");
  }

  Future<Map<String, dynamic>> patch(String path, {dynamic data}) async {
    final response = await dio.patch(path, data: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    }
    throw Exception("Failed to patch data with statusCode: ${response.statusCode}");
  }

  Future<List> getList(String path,
      {Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      final response = await dio.get(path, queryParameters: query);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data as List;
      } else {
        throw Exception("Failed to fetch list with statusCode: ${response.statusCode}");
      }
    } catch (e) {
      print("Failed to fetch list with error: $e");
      throw e;
    }
  }

}
