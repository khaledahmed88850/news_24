import 'package:dartz/dartz.dart';
import 'package:news_24/core/errors/failure.dart';
import 'package:news_24/features/home/data/model/news_model/news_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<NewsModel>>> getNews(String category);
  Future<Either<Failure, List<NewsModel>>> getNewsBySearch(String query);
}
