import 'package:news_24/features/home/data/model/news_model/news_model.dart';
import 'package:news_24/features/home/data/model/news_model/source.dart';

final NewsModel dummyNews = NewsModel(
  source: Source(id: '1', name: 'name name name'),
  author: 'author author ',
  title:
      'title title title title title title title title title title title title title ',
  description: 'description',
  url: 'url',
  urlToImage: '',
  publishedAt: 'publishedAt',
  content: 'content',
);
List<NewsModel> dummyNewsList = List.generate(5, (index) => dummyNews);
