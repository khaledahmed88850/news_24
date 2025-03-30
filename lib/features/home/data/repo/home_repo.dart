import 'package:dartz/dartz.dart';
import 'package:news_24/core/errors/failures.dart';
import 'package:news_24/features/home/data/model/news_model/news_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<NewsModel>>> getNews(String category);
}
