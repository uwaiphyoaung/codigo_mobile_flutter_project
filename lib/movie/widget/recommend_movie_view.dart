import 'package:codigo_project/general/entity/movie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../general/constants/app_constants.dart';
import '../../general/widget/image_view.dart';
import '../detail/movie_detail_screen.dart';
import '../presenter/movie_presenter.dart';

class RecommendedMovieItem extends StatefulWidget{
  Movie data;
  RecommendedMovieItem(this.data);

  @override
  State<StatefulWidget> createState() => RecommendedMovieItemState();

}

class RecommendedMovieItemState extends State<RecommendedMovieItem>{

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: InkWell(
        onTap: (){
          Get.to(()=>MovieDetailScreen(widget.data));
        },
        child: Container(
          width: 130,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ImageView(
                  url: AppConstants.baseImgUrl + widget.data.backdropPath,
                  alignment: Alignment.center,
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10,),
              Text(widget.data.title, style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.w800), maxLines: 2, overflow: TextOverflow.ellipsis,),
              Row(
                children: [
                  IconButton(
                      onPressed: (){
                        MoviePresenter().updateWishlistStatus(context, widget.data);
                      },
                      icon: Icon(Icons.favorite, color: widget.data.isFavorite? Colors.red: Colors.grey,)),
                  SizedBox(width: 7,),
                  Text(widget.data.voteAverage.toString(), style: TextStyle(color: Colors.grey,fontSize: 15, fontWeight: FontWeight.w800), maxLines: 2, overflow: TextOverflow.ellipsis,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}