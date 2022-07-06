import 'package:flutter/material.dart';

class HotelNameWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 100, left: 15, right: 25, bottom: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text("Furama Riverfront, \nSingapore",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, height: 1.4),),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(Icons.chevron_right, color: Colors.deepOrangeAccent, size: 20,),
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text("405 Havelock Road, Singapore 169633"),
              ),
              Image.asset("assets/hotel/currentlocation.png",width: 20,)
            ],
          ),
        ],
      )
    );
  }

}