import 'package:booklyapp/core/utils/services_locator.dart';
import 'package:booklyapp/features/auth/data/repos/auth_repo_impl.dart';
import 'package:booklyapp/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:booklyapp/features/auth/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody(),
    );
  }
}
