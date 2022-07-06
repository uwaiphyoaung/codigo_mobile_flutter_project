import 'package:codigo_project/general/widget/image_view.dart';
import 'package:flutter/material.dart';

class RoomItemView extends StatelessWidget{
  bool isLast;

  RoomItemView(this.isLast);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
      child: Column(
        children: [
          ImageView(
              url: "https://foto.hrsstatic.com/fotos/0/3/545/350/80/000000/http%3A%2F%2Ffoto-origin.hrsstatic.com%2Ffoto%2F0%2F4%2F6%2F1%2F046135%2F046135_z33_5434700.jpg/tUJlLkvi0fkX%2Br1MhmBX4g%3D%3D/2048,1366/6/Furama_Riverfront-Singapur-Doppelzimmer_Standard-1-46135.jpg",
              fit: BoxFit.cover,
              alignment: Alignment.center),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Deluxe Twin", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                      SizedBox(height: 5,),
                      Text("Twin single beds, Cable TV, Free Wifi ")
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red)
                  ),
                  padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                  child: Text("View Rates", style: TextStyle(color: Colors.red, fontSize: 15),),
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text("Avg. Nightly/ Room From", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text("SGD", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                    Text("161.42", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
                  ],
                ),
              )
            ],
          ),
          isLast?SizedBox():SizedBox(height: 15,),
          isLast?SizedBox():SizedBox(
            height: 1,
            child: Container(
              width: double.infinity,
              color: Colors.black38,
            ),)
        ],
      ),
    );
  }

}