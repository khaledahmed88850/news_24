part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final UserModel userModel;

  SignInSuccess({required this.userModel});
}

final class SignInFailure extends SignInState {
  final String message;

  SignInFailure({required this.message});
}
