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
    result.fold((l) {
      emit(LoginFailure(error: l.errorMessage));
    }, (user) {
      emit(LoginSucess(userModel: user));
    });
  }
}
