import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_24/features/home/data/model/news_model/news_model.dart';
import 'package:news_24/features/home/data/repo/home_repo.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.homeRepo) : super(NewsInitial());
  final HomeRepo homeRepo;

  Future<void> getNews({required String category}) async {
    emit(NewsLoading());
    final result = await homeRepo.getNews(category);
    result.fold(
      (failure) => emit(NewsFailure(message: failure.errMesage)),
      (news) => emit(NewsSuccess(newsList: news)),
    );
  }

  Future<void> getNewsBySearch({required String query}) async {
    emit(NewsLoading());
    final result = await homeRepo.getNewsBySearch(query);
    result.fold(
      (failure) => emit(NewsFailure(message: failure.errMesage)),
      (news) => emit(NewsSuccess(newsList: news)),
    );
  }
}
