import 'package:booklyapp/core/utils/services_locator.dart';
import 'package:booklyapp/features/search/data/repos/search_repo.dart';
import 'package:booklyapp/features/search/data/repos/search_repo_impl.dart';
import 'package:booklyapp/features/search/presentation/managers/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/search_view_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocProvider(
        child:
           SearchViewBody(),
         create: (BuildContext context) =>
             SearchCubit(getit.get<SearchRepoImpl>()),
      )),
    );
  }
}
