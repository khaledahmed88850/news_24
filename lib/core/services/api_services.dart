import 'package:dio/dio.dart';
import 'package:news_24/core/utils/backend_end_points.dart';

class ApiServices {
  static final String _baseUrl =
      'https://newsapi.org/v2/top-headlines?country=us';
  final Dio dio;

  ApiServices({required this.dio});

  Future<List<dynamic>> getData({required String path}) async {
    Response data;
    if (path.isNotEmpty || path != '') {
      data = await dio.get(
        '$_baseUrl&category=$path&apiKey=${BackendEndPoints.apiKey}',
      );
    } else {
      data = await dio.get('$_baseUrl&apiKey=${BackendEndPoints.apiKey}');
    }
    return data.data['articles'];
  }
}
