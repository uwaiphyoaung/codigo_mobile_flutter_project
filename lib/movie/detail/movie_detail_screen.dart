import 'package:codigo_project/general/constants/app_constants.dart';
import 'package:codigo_project/general/entity/movie.dart';
import 'package:codigo_project/general/widget/image_view.dart';
import 'package:codigo_project/movie/bloc/detail/detail_bloc.dart';
import 'package:codigo_project/movie/widget/home_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general/entity/movie_detail_entity.dart';
import '../../util/date_utils.dart';
import '../presenter/movie_presenter.dart';
import '../widget/cast_item_view.dart';
import '../widget/movie_detail_error_view.dart';

class MovieDetailScreen extends StatefulWidget{
  Movie movie;

  MovieDetailScreen(this.movie);

  @override
  State<StatefulWidget> createState() => MovieDetailScreenState();

}

class MovieDetailScreenState extends State<MovieDetailScreen>{

  bool isFav = false;

  @override
  void initState() {
    super.initState();
    isFav = widget.movie.isFavorite;
    MoviePresenter().findMovieDetail(context,widget.movie.id);
  }

  changeLocalStatus(){
    setState((){
      isFav = !isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.movie.id);
    return Scaffold(
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state){
          if(state is DetailError){
            return ErrorView(state.type, widget.movie.id);
          }
          if(state is DetailDataState){
            String genresData = "";
            for(GenersData g in state.data.genres){
              if(genresData.isNotEmpty){
                genresData = genresData + ", " + g.name;
              }else{
                genresData = g.name;
              }
            }
            return NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                  SliverAppBar(
                    elevation: 0.1,
                    backgroundColor: Colors.white,
                    floating: true,
                    pinned: true,
                    leading: IconButton(
                        onPressed: ()
                        {
                          Navigator.of(context).pop();
                        },
                        icon: CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          radius: 35,
                          child: Center(
                            child: Icon(Icons.chevron_left, color: Colors.black,),
                          ),
                        )),
                    expandedHeight: 300.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: ImageView(
                            url: AppConstants.baseImgUrl + state.data.poster_path,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Container(
                color: Colors.blue.shade500,
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        child: SingleChildScrollView(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child:
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(top: 8),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(state.data.original_title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                                                Container(
                                                  padding: EdgeInsets.only(top: 7),
                                                  child: Row(
                                                    children: [
                                                      Text(state.data.original_language.toUpperCase() , style: TextStyle(fontSize: 16)),
                                                      SizedBox(width: 10,),
                                                      Container(
                                                        width: 2,
                                                        height: 15,
                                                        color: Colors.grey.shade900,
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Text(MyDateUtils.chageDate(state.data.release_date), style: TextStyle(fontSize: 15)),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(top: 7),
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                        onPressed: ()
                                                        {
                                                          changeLocalStatus();
                                                          MoviePresenter().updateWishlistStatus(context, widget.movie);
                                                        },
                                                        icon: Icon(isFav?Icons.favorite:Icons.favorite_border, color: Colors.red,)),
                                                    SizedBox(width: 10,),
                                                    Text("${state.data.vote_average*10} %", style: TextStyle(fontSize: 18)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Text("${state.data.vote_count} votes", style: TextStyle(fontSize: 15),),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 30),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("${state.data.runtime} min" , style: TextStyle(fontSize: 14, color: Colors.blue.shade900, fontWeight: FontWeight.w800)),
                                                SizedBox(width: 5,),
                                                Container(
                                                  width: 2,
                                                  height: 15,
                                                  color: Colors.blue.shade900,
                                                ),
                                                SizedBox(width: 5,),
                                                Expanded(child: Text(genresData, style: TextStyle(fontSize: 14, color: Colors.blue.shade900, fontWeight: FontWeight.w800))),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text("${state.data.spoken_languages[0].english_name}" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                              SizedBox(width: 10,),
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                color: Colors.grey.shade300,
                                                child: Center(
                                                  child: Text("2D"),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 30),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Movie description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                        SizedBox(height: 7,),
                                        Text("${state.data.overview}")
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Cast", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                            InkWell(
                                              child: Text("View all", style: TextStyle(color: Colors.redAccent),),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 7,),
                                        Container(
                                          height: 230,
                                          child: ListView.separated(
                                            separatorBuilder: (BuildContext context, int index) {
                                              return const SizedBox(width: 1,);
                                            },
                                            primary: false,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 10,
                                            shrinkWrap: true,
                                            itemBuilder: (BuildContext context, int index) {
                                              return CastItemView();
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          ,
                        ),
                      ),),
                    Container(
                        padding: EdgeInsets.only(top: 10,bottom: 15),
                        color: Colors.blue.shade500,
                        child: TextButton(
                          onPressed: (){},
                          child: Text("Book Tickets", style: TextStyle(color: Colors.white, fontSize: 18),),
                        ))
                  ],
                ),
              ),
            );
          }
          return const HomeLoadingWidget();
        },
      ),
    );
  }

}