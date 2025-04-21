// import 'package:booklyapp/core/utils/styles.dart';
// import 'package:booklyapp/features/book_detials/presentation/view/widgets/custom_app_bar_book_detials.dart';
// import 'package:booklyapp/features/book_detials/presentation/view/widgets/custom_txt_btn.dart';
// import 'package:booklyapp/features/book_detials/presentation/view/widgets/similiar_list_view.dart';
// import 'package:booklyapp/features/home/data/models/book_model.dart';
// import 'package:booklyapp/features/home/presentation/view/widget/custom_book_item.dart';
// import 'package:booklyapp/features/home/presentation/view/widget/rating_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// class BookDetialsViewBody extends StatelessWidget {
//    BookDetialsViewBody ({super.key, required this.bookModel});
// final BookModel bookModel;
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverFillRemaining(
//           child: Column(
//             children: [
//               CustomBookDetialsAppBar(),
//               Padding(
//                 padding:  EdgeInsets.symmetric
//                   (horizontal: MediaQuery.of(context).size.width*0.18),
//                 child: CustomBooKItem(
//                   image: bookModel.volumeInfo!.imageLinks!.thumbnail??'https://i.pinimg.com/550x/82/60/c3/8260c358617564297ca30c4dbbef7c26.jpg',
//                 ),
//               ),
//               SizedBox(height: 6.0,),
//               Padding(
//                 padding:  EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Text( bookModel.volumeInfo!.title!,textAlign: TextAlign.center,style: Styles.text30,),
//               ),
//               SizedBox(height: 6.0,),
//               Opacity(
//                   opacity: 0.7,
//                   child: Text(bookModel.volumeInfo!.authors![0],style: Styles.text18.copyWith(
//                       fontStyle: FontStyle.italic
//                   ),)),
//               SizedBox(height: 16.0,),
//               RatingWidget(
//                 rating: bookModel.volumeInfo!.maturityRating!,
//                 count: bookModel.volumeInfo!.pageCount!,
//                 mainAxisAlignment: MainAxisAlignment.center,)
//                ,SizedBox(height: 16.0,),
//               Padding(
//                 padding:  EdgeInsets.symmetric(horizontal:
//                 MediaQuery.of(context).size.width*0.05),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: CustomTxtBtn(txt: "Free\$",
//                           bg: Colors.white,
//                           txtColor: Colors.black,
//                           radius: BorderRadius.only(
//                               topLeft: Radius.circular(16.0),
//                               bottomLeft: Radius.circular(16.0)
//                           ),
//                           onPressed: (){
//
//                           }),
//                     ),
//                     Expanded(
//                       child: CustomTxtBtn(txt: "Preview",
//                           bg: Color(0xffEF8262),
//                           txtColor: Colors.white,
//                           radius: BorderRadius.only(
//                               topRight: Radius.circular(16.0),
//                               bottomRight: Radius.circular(16.0)
//                           ),
//                           onPressed: (){
//
//                           }),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(child: SizedBox(
//                 height: 40.0,
//               )),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(" You Can also like this",style: Styles.text20.copyWith(
//                     color: Colors.white
//                 ),),
//               ),
//               SizedBox(height: 16.0,),
//               SimiliarBookList(),
//             ],
//           ),
//         )
//       ],
//     );
//
//
//   }
// }
import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/book_detials/presentation/view/widgets/custom_app_bar_book_detials.dart';
import 'package:booklyapp/features/book_detials/presentation/view/widgets/custom_txt_btn.dart';
import 'package:booklyapp/features/book_detials/presentation/view/widgets/similiar_list_view.dart';
import 'package:booklyapp/features/home/data/models/book_model.dart';
import 'package:booklyapp/features/home/presentation/managers/fetch_similiar_books/fetch_similiar_books_cubit.dart';
import 'package:booklyapp/features/home/presentation/view/widget/custom_book_item.dart';
import 'package:booklyapp/features/home/presentation/view/widget/rating_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetialsViewBody extends StatelessWidget {
  final BookModel bookModel;
  const BookDetialsViewBody
      ({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomBookDetialsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.18,
              vertical: MediaQuery.of(context).size.width*0.05
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CustomBooKItem(
                  image: bookModel.volumeInfo!.imageLinks!.thumbnail ??
                      'https://i.pinimg.com/550x/82/60/c3/8260c358617564297ca30c4dbbef7c26.jpg',
                ),
                IconButton(onPressed: (){
                 context.read<FetchSimiliarBooksCubit>()
                     .addBookToSavedBooks(bookModel).then((value) {

                 }).catchError((error){
                       print("the error in saved $error");
                 });
                  //BlocProvider.of<SavedBookCubit>(context).addBookToSavedBooks(bookModel);
                }, icon: Icon(
                  CupertinoIcons.bookmark_fill,
                  size: 40,
                  color: Colors.white,))
              ],
            ),
          ),
          const SizedBox(height: 6.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              bookModel.volumeInfo!.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Styles.text30,
            ),
          ),
          const SizedBox(height: 6.0),
          Opacity(
            opacity: 0.7,
            child: Text(
              bookModel.volumeInfo!.authors?[0]??"",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Styles.text18.copyWith(fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(height: 16.0),
          RatingWidget(
            rating: bookModel.volumeInfo!.maturityRating!,
            count: bookModel.volumeInfo!.pageCount!,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomTxtBtn(
                    txt: "Free",
                    bg: Colors.white,
                    txtColor: Colors.black,
                    radius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0),
                    ),
                    onPressed: () {
                      _launchUrl(bookModel.volumeInfo!.infoLink!);
                    },
                  ),
                ),
                Expanded(
                  child: CustomTxtBtn(
                    txt:getTxt(  BookModel ),
                    bg: const Color(0xffEF8262),
                    txtColor: Colors.white,
                    radius: const BorderRadius.only(
                      topRight: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    ),
                    onPressed: () {
                      _launchUrl(bookModel.volumeInfo!.previewLink!);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40.0),
          // Replaced Expanded with SizedBox
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "You Can also like this",
                style: Styles.text20.copyWith(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
           SimiliarBookList(
             bookModel: bookModel,
           ),
          const SizedBox(height: 20.0), // Optional padding at the bottom
        ],
      ),
    );
  }
  Future<void> _launchUrl(String url) async {
    final _url=Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  String getTxt( BookModel ) {
    if(bookModel.volumeInfo!.previewLink==null){
      return "Not Avaliable";
    }else{
      return "Preview";
    }
  }
}
