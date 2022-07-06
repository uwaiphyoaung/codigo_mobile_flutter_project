import 'package:codigo_project/hotel/pages/rates_page.dart';
import 'package:codigo_project/hotel/pages/room_page.dart';
import 'package:codigo_project/hotel/widget/hotel_stat_widget.dart';
import 'package:codigo_project/hotel/widget/photo_list_widget.dart';
import 'package:flutter/material.dart';

import 'widget/hotel_name_widget.dart';

class HotelScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HotelScreenState();

}

class HotelScreenState extends State<HotelScreen>{

  TabBar get _tabbar => TabBar(
    indicatorColor: Colors.white,
    labelStyle: TextStyle(fontSize: 18),
    unselectedLabelStyle: TextStyle(fontSize: 14),
    tabs: [
      Tab(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(left: 15,right: 15,top: 7,bottom: 7),
          color: Colors.white,
          child: Center(
            child: Text("By Room", style: TextStyle(color: Colors.black),),
          ),
        ),),
      Tab(child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left: 15,right: 15,top: 7,bottom: 7),
        color: Colors.white,
        child: Center(
          child: Text("By Rates", style: TextStyle(color: Colors.black),),
        ),
      ),),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                actions: [
                  Image.asset("assets/hotel/currency.png",width: 45,),
                  Image.asset("assets/hotel/chatactive.png",width: 45,),
                ],
                backgroundColor: Colors.white,
                floating: true,
                pinned: true,
                leading: Icon(Icons.arrow_back, color: Colors.deepOrangeAccent,) ,
                expandedHeight: 520.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    child: Column(
                      children: [
                        HotelNameWidget(),
                        PhotoGallery(),
                        HotelStatWidget(),
                        SizedBox(height: 10,)
                      ],
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: _tabbar.preferredSize,
                  child: ColoredBox(
                    color: Colors.white,
                    child: _tabbar,
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              RoomPage(),
              RatesPage(),
            ],
          ),
        ),
      ),
    );
  }

}