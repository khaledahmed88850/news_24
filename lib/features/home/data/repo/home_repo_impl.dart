import 'package:dartz/dartz.dart';
import 'package:news_24/core/errors/failures.dart';
import 'package:news_24/core/services/api_services.dart';
import 'package:news_24/features/home/data/model/news_model/news_model.dart';
import 'package:news_24/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl({required this.apiServices});
  @override
  Future<Either<Failures, List<NewsModel>>> getNews(String category) async {
    try {
      var data = await apiServices.getData(path: category);
      List<NewsModel> newsList =
          data.map((e) => NewsModel.fromJson(e)).toList();
      return Right(newsList);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
