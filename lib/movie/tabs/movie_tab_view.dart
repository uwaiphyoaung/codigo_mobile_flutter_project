import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../general/widget/bottom_loader.dart';
import '../../util/list_scroll_controller.dart';
import '../pages/recommend_movie_list.dart';
import '../pages/upcomming_movie_list.dart';
import '../presenter/movie_presenter.dart';

class MovieTabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MovieTabViewState();
}

class MovieTabViewState extends State<MovieTabView> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final _scrollController = ListScrollController();

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 100));
    MoviePresenter().fetchPopularList(context);
    MoviePresenter().fetchUpcomingList(context, true);
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 100));
    MoviePresenter().fetchUpcomingList(context, false);
    _refreshController.loadComplete();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: const WaterDropMaterialHeader(
        color: Colors.black,
        backgroundColor: Colors.white,
        distance: 30,
      ),
      footer: CustomFooter(
        height: 20,
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = BottomLoader();
          } else if (mode == LoadStatus.loading) {
            body = BottomLoader();
          } else {
            body = Center(child: Text("You have pulled all movies"));
          }
          return SizedBox(
            height: 20.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: CustomScrollView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          controller: _scrollController..unPause(),
          primary: false,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: RecommendedMovieList(),
            ),
            // SliverPadding(
            //   padding: const EdgeInsets.only(top: 16.0),
            //   sliver: UpCommingMovieList(),
            // ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 15.0,),
                child: Text("Upcomming Movies", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
              ),
            ),
            UpCommingMovieList(),
          ]),
    );
  }
}
