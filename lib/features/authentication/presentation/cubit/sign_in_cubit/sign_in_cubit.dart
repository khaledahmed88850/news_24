import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_24/features/authentication/data/models/user_model.dart';
import 'package:news_24/features/authentication/data/repo/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signIn(UserModel userModel) async {
    emit(SignInLoading());
    var result = await authRepo.signInWithEmailAndPassword(
      userModel.email,
      userModel.uId,
    );
    result.fold(
      (failure) => emit(SignInFailure(message: failure.message)),
      (userModel) => emit(SignInSuccess(userModel: userModel)),
    );
  }
}
