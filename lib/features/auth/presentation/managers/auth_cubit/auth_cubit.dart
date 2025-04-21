import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/auth/data/models/user_model.dart';
import 'package:booklyapp/features/auth/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
 final AuthRepo authRepo;
 UserModel? userModel;
Future<void> createUser(
  {
   required String name,required
  String email,required String password
}
     )async{
  var result=await
  authRepo.createUser(name, email, password);
emit(RegisterLoading());
result.fold((l) {
  emit(RegisterFailure(error: l.errorMessage));
}, (user) {

 emit(RegisterSucess(userModel: user));
});
 }
  Future<void> login(
      {
      required
      String email,required String password
      }
      )async{
    var result=await
    authRepo.login( email, password);
    emit(LoginLoading());
    result.fold((failure) {
      emit(LoginFailure(error: failure.errorMessage));
    }, (user) {
      emit(LoginSucess(userModel: user));
    });
  }
  Future<void> resetPassword(String email)async{

  var result=await authRepo.forgetPassword(email);
  emit(ForgetPasswordLoading());
  result.fold((failure) {
    emit(ForgetPasswordFailure(error: failure.errorMessage));
  }, (r)  {
    emit(ForgetPasswordSucess());
  });
  }
}
