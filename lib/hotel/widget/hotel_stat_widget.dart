import 'package:flutter/material.dart';

class HotelStatWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15,bottom: 15,left: 15,right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildItem(context, "Amenities", "assets/hotel/theme.png"),
          buildItem(context, "Facilities", "assets/hotel/workout.png"),
          buildItem(context, "F&B", "assets/hotel/fnb.png"),
          buildItem(context, "Fids/Family", "assets/hotel/kidsfamily.png"),
          buildItem(context, "Wellness", "assets/hotel/wellness.png"),
        ],
      ),
    );
  }
}

Column buildItem(BuildContext context, String name, String img) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(3),
        child: Image.asset(img),
      ),
      SizedBox(height: 5,),
      Text(name,style: TextStyle(fontSize: 12,  fontWeight: FontWeight.w200, ), textAlign: TextAlign.center,),

    ],
  );
}