import 'package:booklyapp/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/services_locator.dart';
import '../managers/auth_cubit/auth_cubit.dart';
import '../widgets/register_view_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getit.get<AuthRepoImpl>()),
      child: Scaffold(
        body: CustomViewBody(

        ),
      ),
    );
  }
}
