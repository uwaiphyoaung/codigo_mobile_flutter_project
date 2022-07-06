import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/popular/popular_bloc.dart';
import '../widget/recommend_movie_view.dart';

class RecommendedMovieList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularBloc, PopularState>(
      builder: (context, state) {
        if (state is PopularListSuccessState) {
          return Container(
            margin: EdgeInsets.only(bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 3, top: 25),
                  child: Text("Recommended", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 280,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 1,);
                    },
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return RecommendedMovieItem(state.dataList[index]);
                    },
                  ),
                )
              ],
            ),
          );
        }

        return Container();
      },
    );
  }

}