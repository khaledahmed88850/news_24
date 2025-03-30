import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_24/core/errors/failure.dart';
import 'package:news_24/core/services/api_services.dart';
import 'package:news_24/features/home/data/model/news_model/news_model.dart';
import 'package:news_24/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, List<NewsModel>>> getNews(String category) async {
    try {
      var data = await apiServices.getData(path: category);
      List<NewsModel> newsList =
          data.map((e) => NewsModel.fromJson(e)).toList();
      return Right(newsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMesage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NewsModel>>> getNewsBySearch(String query) async {
    try {
      var data = await apiServices.getData(query: query, path: null);
      List<NewsModel> newsList =
          data.map((e) => NewsModel.fromJson(e)).toList();
      return Right(newsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMesage: e.toString()));
    }
  }
}
