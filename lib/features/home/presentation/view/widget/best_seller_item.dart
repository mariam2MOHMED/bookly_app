import 'package:booklyapp/core/utils/assets.dart';
import 'package:booklyapp/core/utils/functions/functions.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/home/data/models/book_model.dart';
import 'package:booklyapp/features/home/presentation/view/widget/rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
class BestSellerItem extends StatelessWidget {
BookModel bookModel;
   BestSellerItem({required this.bookModel});
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: (){
          GoRouter.of(context).push(AppRouter.kBookDetailsView,
              extra: bookModel);
        },
        child: SizedBox(
        height: 140,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 2.8/4,
                child:
                CachedNetworkImage(
                    fit: BoxFit.fill,
                    placeholder: (context,url)=>Center(child: CircularProgressIndicator(
                      color: Colors.white,
                    )),
                    errorWidget: (context,url,error)=>Icon(Icons.image_not_supported_rounded,
                      color: Colors.white,),
                    imageUrl: bookModel.volumeInfo!.imageLinks?.thumbnail??"http://books.google.com/books/content?id=SI7fAAAAMAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")

              ),
            ),
            SizedBox(width: 30.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(bookModel.volumeInfo!.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.text20.copyWith(
                        fontWeight: FontWeight.bold,color: Colors.white
                      ),),
                  ),
                 const SizedBox(height: 3,),
                  Text(bookModel.volumeInfo?.authors?[0]??
                      "JK Rowling",maxLines: 1,overflow: TextOverflow.ellipsis,style: Styles.text14,),
                  const SizedBox(height: 3,),
                  Row(
                    children: [
                      Text("Free",
                        style: Styles.text20.copyWith(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontWeight: FontWeight.bold,color: Colors.white
                      ),),
                      Spacer(),
                      RatingWidget(
                        rating: bookModel.volumeInfo!.maturityRating??"0",
                        count: bookModel.volumeInfo!.pageCount??250,
                      )
                    ],
                  )

                ],
              ),
            )
          ],
        ),
            ),
      );
  }
}
