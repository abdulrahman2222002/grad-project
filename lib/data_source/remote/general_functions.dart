
  import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

final dio = Dio();

  Future<dynamic> fetchData({String? url, Map<String,dynamic>? reqBody,Map<String, dynamic>? queryParameters}) async {
    try {
      debugPrint('fetchData URL : $url');
      // final response = await dio.get(url,data: {}, options: Options(headers: {'Authorization': 'Bearer $token'}));
      final response = await dio.get(
        url ?? '' ,
        data: reqBody ?? {},
        queryParameters: queryParameters ?? {},
      );
      // debugPrint('fetchData response : ${response.data}');
      return response.data;
    } catch (e) {
      // Handle the error
      logger.e('fetchData Error ${e.toString()}');
      return null;
    }
  }

  Future<dynamic> sendData({String? url, dynamic data, String? token}) async {
    try {
      final response = await dio.post(url??'',
          data: data,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return response.data;
    } catch (e) {
      // Handle the error
      debugPrint(e.toString());
      return null;
    }
  }