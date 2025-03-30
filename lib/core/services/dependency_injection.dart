import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_24/core/services/api_services.dart';
import 'package:news_24/core/services/auth_services.dart';
import 'package:news_24/core/services/firestore_services.dart';
import 'package:news_24/features/authentication/data/repo/auth_repo.dart';
import 'package:news_24/features/authentication/data/repo/auth_repo_impl.dart';
import 'package:news_24/features/home/data/repo/home_repo.dart';
import 'package:news_24/features/home/data/repo/home_repo_impl.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiServices>(ApiServices(dio: setupDio()));
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(apiServices: getIt<ApiServices>()),
  );
  getIt.registerSingleton<FirestoreServices>(FirestoreServices());
  getIt.registerSingleton<AuthServices>(AuthServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      authServices: getIt<AuthServices>(),
      firestoreServices: getIt<FirestoreServices>(),
    ),
  );
}

Dio setupDio() {
  Dio dio = Dio();

  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      requestBody: true,
      error: true,
      request: true,
      requestHeader: false,
      responseHeader: false,
    ),
  );
  return dio;
}
