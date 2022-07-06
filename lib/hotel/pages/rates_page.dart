import 'package:flutter/material.dart';

import '../widget/review_item_view.dart';

class RatesPage extends StatelessWidget{
  late List<RatesData>  ratesList = [
    RatesData("Mobile App Special Voucher", true),
    RatesData("Weekend Staycation", false)
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:ratesList.length,
        itemBuilder: (context,index){
          return ReviewItemView(ratesList[index]);
        });
  }

}

class RatesData{
  late String title;
  late bool hasSub;

  RatesData(this.title, this.hasSub);
}