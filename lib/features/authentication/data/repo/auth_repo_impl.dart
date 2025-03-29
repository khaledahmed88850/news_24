import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_24/core/errors/exceptions.dart';
import 'package:news_24/core/errors/failures.dart';
import 'package:news_24/core/services/auth_services.dart';
import 'package:news_24/core/services/firestore_services.dart';
import 'package:news_24/core/utils/backend_end_points.dart';
import 'package:news_24/features/authentication/data/models/user_model.dart';
import 'package:news_24/features/authentication/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthServices authServices;
  final FirestoreServices firestoreServices;

  AuthRepoImpl({required this.firestoreServices, required this.authServices});
  @override
  Future<Either<Failures, UserModel>> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      User user = await authServices.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = UserModel.fromirebaseUser(user);
      await addUserData(user: userModel);
      return Right(userModel);
    } on Customexception catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failures, UserModel>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await authServices.signInWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );
      var userModel = await getUserData(uId: user.uid);
      return Right(userModel);
    } on Customexception catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(
        ServerFailure(message: 'حدث خطأ ما. يرجى المحاولة مرة أخرى'),
      );
    }
  }

  Future<UserModel> getUserData({required String uId}) async {
    var userData = await firestoreServices.getData(
      path: BackendEndPoints.users,
      documentId: uId,
    );
    return UserModel.fromJson(userData);
  }

  Future addUserData({required UserModel user}) async {
    firestoreServices.addData(
      documentId: user.uId,
      path: BackendEndPoints.users,
      data: user.toJson(),
    );
  }
}
