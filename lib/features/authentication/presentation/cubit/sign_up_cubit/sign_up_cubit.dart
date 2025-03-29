import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_24/features/authentication/data/models/user_model.dart';
import 'package:news_24/features/authentication/data/repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;
  Future<void> signUp(UserModel userModel) async {
    emit(SignUpLoading());
    var result = await authRepo.signUpWithEmailAndPassword(
      userModel.email,
      userModel.uId,
    );
    result.fold(
      (failure) => emit(SignUpFailure(message: failure.message)),
      (userModel) => emit(SignUpSuccess(userModel: userModel)),
    );
  }
}
