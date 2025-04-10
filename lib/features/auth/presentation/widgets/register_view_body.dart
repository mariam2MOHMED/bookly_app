import 'package:booklyapp/core/utils/app_colors.dart';
import 'package:booklyapp/core/utils/constants.dart';
import 'package:booklyapp/core/utils/functions/functions.dart';
import 'package:booklyapp/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:booklyapp/features/auth/presentation/widgets/custom_btn.dart';
import 'package:booklyapp/features/auth/presentation/widgets/custom_txt_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomViewBody extends StatelessWidget {
  const CustomViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var userName = TextEditingController();
    var email = TextEditingController();
    var password = TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
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
                    child: Text("Create account to join us", style: TextStyle(
                        fontFamily: kGtSectraFine,
                        fontSize: 24,
                        color: Colors.white
                    ),),),
                ),
                const SizedBox(height: 30.0,),
                CustomTxtField(hint: "user Name",
                    prefixIcon: Icons.person, controller: userName),
                const SizedBox(height: 20.0,),
                CustomTxtField(hint: "E-mail",
                    prefixIcon: Icons.email, controller: email),
                const SizedBox(height: 20.0,),
                CustomTxtField(hint: "Password",
                    prefixIcon: Icons.password,
                    isPassword: true,
                    controller: password),
                const SizedBox(height: 30.0,),
                customBtnAuth(onPressed: () {
                  // BlocProvider.of<AuthCubit>(context).
                  // createUser(name: userName.text,
                  //     email: email.text, password: password.text);
                  context.read<AuthCubit>().createUser
                    (name: userName.text,
                      email: email.text, password: password.text).then((value) {
                        GoRouter.of(context).push(AppRouter.kloginView);
                  }).catchError((error){
                        print("the error in register is ${error}");
                  });
                }, txt: "Create Account"),

                const SizedBox(height: 20.0,),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Already Have an Account",
                        style: TextStyle(
                            fontFamily: kGtSectraFine, fontSize: 24.0,
                            color: Colors.white
                        ),),),
                    Opacity(
                      opacity: 0.7,
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).
                          push(AppRouter.kloginView);
                        },
                        child: Text(" Sign in", style: TextStyle(
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
