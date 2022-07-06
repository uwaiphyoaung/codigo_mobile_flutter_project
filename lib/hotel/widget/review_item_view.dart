import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../pages/rates_page.dart';
import 'hotel_stat_widget.dart';

class ReviewItemView extends StatelessWidget{
  RatesData data;
  ReviewItemView(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
      child: DottedBorder(
        color: Colors.grey,
        strokeWidth: 1,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              data.hasSub?Text("YOU ARE E-VOUCHER RATE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),):SizedBox(),
                              SizedBox(height: 5,),
                              Text(data.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                            ],
                          ),
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right, color: Colors.red,))
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child:  buildItem(context, "Inclusive of Breakfast", "assets/hotel/fnb.png"),
                      ),
                      Expanded(
                        child: buildItem(context, "20% off in-Room Service", "assets/hotel/discount.png"),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          margin: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red)
                          ),
                          padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Text("View Rates", style: TextStyle(color: Colors.red, fontSize: 15),),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  SizedBox(
                    height: 1,
                    child: Container(
                      width: double.infinity,
                      color: Colors.black38,
                    ),),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Avg. Nightly/ Room From", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              Text("Subject to CST & Service charge", style: TextStyle( fontSize: 12))
                            ],
                          ),
                        ),
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
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 7,bottom: 7),
                color: Colors.orangeAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.card_membership),
                    SizedBox(width: 10,),
                    Text("MEMBERS DEAL", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}