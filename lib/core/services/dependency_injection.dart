import 'package:get_it/get_it.dart';
import 'package:news_24/core/services/auth_services.dart';
import 'package:news_24/core/services/firestore_services.dart';
import 'package:news_24/features/authentication/data/repo/auth_repo.dart';
import 'package:news_24/features/authentication/data/repo/auth_repo_impl.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirestoreServices>(FirestoreServices());
  getIt.registerSingleton<AuthServices>(AuthServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      authServices: getIt<AuthServices>(),
      firestoreServices: getIt<FirestoreServices>(),
    ),
  );
}
