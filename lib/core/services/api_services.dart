import 'package:dio/dio.dart';
import 'package:news_24/core/utils/backend_end_points.dart';

class ApiServices {
  final _baseUrl = 'https://newsapi.org/v2/top-headlines?country=us';
  final Dio dio;

  ApiServices({required this.dio});

  Future<List<dynamic>> getData({String? path, String? query}) async {
    Response data;
    if (path != null && path != '') {
      data = await dio.get(
        '$_baseUrl&category=$path&apiKey=${BackendEndPoints.apiKey}',
      );
    } else if (query != null) {
      final searchBaseUrl = 'https://newsapi.org/v2/everything';
      data = await dio.get(
        '$searchBaseUrl?q=$query&apiKey=${BackendEndPoints.apiKey}',
      );
    } else {
      data = await dio.get('$_baseUrl&apiKey=${BackendEndPoints.apiKey}');
    }
    return data.data['articles'];
  }
}
