import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:booklyapp/core/utils/functions/functions.dart';
import 'package:booklyapp/features/auth/presentation/widgets/custom_btn.dart';
import 'package:booklyapp/features/auth/presentation/widgets/custom_txt_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/constants.dart';
import '../managers/auth_cubit/auth_cubit.dart';

class ForgetViewBody extends StatelessWidget {
  const ForgetViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var email = TextEditingController();

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is ForgetPasswordSucess){
          AnimatedSnackBar.rectangle(
            'Success',
            ' check your email',
            type: AnimatedSnackBarType.success,
            brightness: Brightness.light,
          ).show(
            context,
          );
        }else if(state is ForgetPasswordLoading){
          LinearProgressIndicator(
            color: Colors.white,
          );
        }else if(state is ForgetPasswordFailure){
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
                  child: Text("Forget Password", style: TextStyle(
                      fontFamily: kGtSectraFine, fontSize: 30.0,
                      color: Colors.white
                  ),),
                ),
                SizedBox(height: 20.0,),
                Align(alignment: Alignment.centerLeft,
                  child: Opacity(
                    opacity: 0.7,
                    child: Text("Don’t worry, it happens. Please enter the address associated with your account", style: TextStyle(
                        fontFamily: kGtSectraFine,
                        fontSize: 24,
                        color: Colors.white
                    ),),),
                ),
                    const SizedBox(height: 50.0,),
                    CustomTxtField(hint: "E-mail",
                    prefixIcon: Icons.email, controller: email),
                const SizedBox(height: 20.0,),



                customBtnAuth(onPressed: () {
                  context.read<AuthCubit>().resetPassword(
                       email.text, ).then((value) {
                    GoRouter.of(context).push(AppRouter.kloginView);
                  }).catchError((error){
                    print("the error in forget Password is ${error}");
                  });;
                }, txt: "Submit"),


              ],
            ),
          ),
        );
      },
    );
  }
}