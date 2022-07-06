import 'package:codigo_project/movie/tabs/movie_tab_view.dart';
import 'package:codigo_project/movie/presenter/movie_presenter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MovieScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MovieScreenState();
}

class MovieScreenState extends State<MovieScreen> {
  final TextEditingController searchText = TextEditingController();


  @override
  void initState() {
    MoviePresenter().fetchPopularList(context);
    MoviePresenter().fetchUpcomingList(context, true);
    super.initState();
  }

  TabBar get _tabbar => TabBar(
    isScrollable: true,
    labelStyle: TextStyle(fontSize: 14),
    unselectedLabelStyle: TextStyle(fontSize: 14),
    tabs: [
      Tab(
        child: Text("Movies", style: TextStyle(color: Colors.black),),
      ),
      Tab(
        child: Text("Events", style: TextStyle(color: Colors.black),),
      ),
      Tab(
        child: Text("Plays", style: TextStyle(color: Colors.black),),
      ),
      Tab(
        child: Text("Sports", style: TextStyle(color: Colors.black),),
      ),
      Tab(
        child: Text("Activies", style: TextStyle(color: Colors.black),),
      ),
    ],
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                pinned: true,
                expandedHeight: 160.0,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: Container(
                    padding: EdgeInsets.only(top: 50, left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("What are you looking for?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: Container(
                                height: 42,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.grey.shade200
                                ),
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: TextField(
                                  onSubmitted: (value) {

                                  },
                                  textInputAction: TextInputAction.search,
                                  autofocus: false,
                                  controller: searchText,
                                  onChanged: (text) {

                                  },
                                  cursorColor: Colors.grey,
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 15),
                                      hintText: "Search for movices, events & more ...",
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Colors.black38,
                                        size: 23,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 12, vertical: 14)),
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Icon(FontAwesomeIcons.sliders, color: Colors.white,),

                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: _tabbar.preferredSize,
                  child: ColoredBox(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: _tabbar,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: MovieTabView(),
              ),
              Container(),
              Container(),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }

}