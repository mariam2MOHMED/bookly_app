part of 'auth_cubit.dart';

abstract class AuthState {}

 class AuthInitial extends AuthState {}
class RegisterLoading extends AuthState {}
class RegisterSucess extends AuthState {
  final UserModel userModel;

  RegisterSucess({required this.userModel});
}
class RegisterFailure extends AuthState {
  final String error;

  RegisterFailure({required this.error});
}
class LoginLoading extends AuthState {}
class LoginSucess extends AuthState {
  final UserModel userModel;

  LoginSucess({required this.userModel});
}
class LoginFailure extends AuthState {
  final String error;

  LoginFailure({required this.error});
}
class ForgetPasswordLoading extends AuthState {}
class ForgetPasswordSucess extends AuthState {

}
class ForgetPasswordFailure extends AuthState {
  final String error;

  ForgetPasswordFailure({required this.error});
}
