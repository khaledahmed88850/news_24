import 'package:dartz/dartz.dart';
import 'package:news_24/core/errors/failures.dart';
import 'package:news_24/features/authentication/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserModel>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failures, UserModel>> signUpWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failures, UserModel>> signInWithGoogle();
}
