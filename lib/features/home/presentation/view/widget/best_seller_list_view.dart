import 'package:booklyapp/core/widgets/custom_error_widget.dart';
import 'package:booklyapp/core/widgets/custom_loading_indictor.dart';
import 'package:booklyapp/features/home/presentation/managers/fetch_newest_books/fetch_newest_cubit.dart';
import 'package:booklyapp/features/home/presentation/view/widget/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({super.key});

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FetchNewestCubit>().fetchNewestBooks();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewestCubit, FetchNewestState>(
      builder: (context, state) {
        if(state is FetchNewestSucess){
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),

            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(

                padding: EdgeInsets.symmetric(vertical: 10),
                child: BestSellerItem(
                  bookModel: state.books[index],
                ),
              );
            },
            itemCount: state.books.length,);
        }
        else if(state is FetchNewestFailure){
          return CustomErrorWidget(error: state.errorMessage);
        }
  else{
    return customLoadingIndictor();
        }
      },
    );
  }
}
