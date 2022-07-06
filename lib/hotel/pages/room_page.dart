import 'package:flutter/material.dart';

import '../widget/room_item_view.dart';

class RoomPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:3,
        itemBuilder: (context,index){
          return RoomItemView(index+1 == 3);
        });
  }

}