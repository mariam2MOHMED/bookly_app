import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:booklyapp/core/utils/functions/functions.dart';
import 'package:booklyapp/features/auth/presentation/widgets/custom_btn.dart';
import 'package:booklyapp/features/auth/presentation/widgets/custom_txt_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/constants.dart';
import '../managers/auth_cubit/auth_cubit.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var email = TextEditingController();
    var password = TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is LoginSucess){
          AnimatedSnackBar.rectangle(
            'Success',
            '${state.userModel.name} logined sucessfuly',
            type: AnimatedSnackBarType.success,
            brightness: Brightness.light,
          ).show(
            context,
          );
          GoRouter.of(context).push(AppRouter.kHomeView);
        }else if(state is LoginLoading){
          LinearProgressIndicator(
            color: Colors.white,
          );

        }else if(state is LoginFailure){
          AnimatedSnackBar.rectangle(
            'Failure',
            '${state.error}',
            type: AnimatedSnackBarType.error,
            brightness: Brightness.light,
          ).show(
            context,
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Welcome User", style: TextStyle(
                      fontFamily: kGtSectraFine, fontSize: 30.0,
                      color: Colors.white
                  ),),
                ),
                SizedBox(height: 20.0,),
                Align(alignment: Alignment.centerLeft,
                  child: Opacity(
                    opacity: 0.7,
                    child: Text("Login to join us", style: TextStyle(
                        fontFamily: kGtSectraFine,
                        fontSize: 24,
                        color: Colors.white
                    ),),),
                ),
                const SizedBox(height: 30.0,),

                CustomTxtField(hint: "E-mail",
                    prefixIcon: Icons.email, controller: email),
                const SizedBox(height: 20.0,),
                CustomTxtField(hint: "Password",
                    prefixIcon: Icons.password,
                    isPassword: true,
                    controller: password),
                const SizedBox(height: 30.0,),
                GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push(AppRouter.kforgetPassordView);
                  },
                  child: Align(alignment: Alignment.centerLeft,
                    child: Opacity(
                      opacity: 0.7,
                      child: Text("Forget Password", style: TextStyle(
                          fontFamily: kGtSectraFine,
                          fontSize: 24,
                          color: Colors.white
                      ),),),
                  ),
                ),
                const SizedBox(height: 20.0,),
                customBtnAuth(onPressed: () {
                  context.read<AuthCubit>().login(
                      email: email.text, password: password.text)
                      .then((value) {

                  }).catchError((error){
                    print("the error in login is ${error}");
                  });;
                }, txt: "Sign In"),

                const SizedBox(height: 20.0,),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Don't Have an Account?",
                        style: TextStyle(
                            fontFamily: kGtSectraFine, fontSize: 24.0,
                            color: Colors.white
                        ),),),
                    Opacity(
                      opacity: 0.7,
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).
                          push(AppRouter.kregisterView);
                        },
                        child: Text(" Sign UP",
                          style: TextStyle(
                            fontFamily: kGtSectraFine, fontSize: 24.0,
                            color: Colors.white
                        ),),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}