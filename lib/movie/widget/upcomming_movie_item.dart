import 'package:codigo_project/general/entity/movie.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';import '../../general/constants/app_constants.dart';


import '../../general/widget/image_view.dart';
import '../detail/movie_detail_screen.dart';
import '../presenter/movie_presenter.dart';
class UpcommingMovieItem extends StatefulWidget{
  Movie data;

  UpcommingMovieItem(this.data);

  @override
  State<StatefulWidget> createState()=> UpcommingMovieItemState();
}

class UpcommingMovieItemState extends State<UpcommingMovieItem>{

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: InkWell(
        onTap: (){
          Get.to(()=>MovieDetailScreen(widget.data));
        },
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: ImageView(
                    url: AppConstants.baseImgUrl + widget.data.backdropPath,
                    alignment: Alignment.center,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.data.title, style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.w800), maxLines: 2, overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 7,),
                      Text(widget.data.overview ,style: TextStyle(color: Colors.black87), overflow: TextOverflow.ellipsis, maxLines: 3 ,),
                      SizedBox(height: 7,),
                      Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: (){
                                      MoviePresenter().updateWishlistStatus(context, widget.data);
                                    },
                                    icon: Icon(Icons.favorite, color: widget.data.isFavorite? Colors.red: Colors.grey,)),
                                SizedBox(width: 2,),
                                Text(widget.data.popularity.toString(), style: TextStyle(color: Colors.grey,fontSize: 15, fontWeight: FontWeight.w800), maxLines: 2, overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                          ),
                          SizedBox(width: 2,),
                          Container(
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: (){},
                                    icon: FaIcon(FontAwesomeIcons.comment, color: Colors.orangeAccent,)),
                                SizedBox(width: 2,),
                                Text(widget.data.voteCount.toString(), style: TextStyle(color: Colors.grey,fontSize: 15, fontWeight: FontWeight.w800), maxLines: 2, overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}