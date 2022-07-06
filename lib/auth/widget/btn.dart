import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

ElevatedButton btn(String title, Color colors, Function onClick, {bool hasIcon=false, IconData iconData=FontAwesomeIcons.facebookF}){
  return ElevatedButton(
      onPressed: (){
            onClick();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(colors),
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                (Set<MaterialState> states) {
              return const EdgeInsets.only(
                  left: 15, right: 20, top: 7, bottom: 7);
            },
          ),),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 5,bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          hasIcon?
          Align(
            alignment: Alignment.centerRight,
            child: FaIcon(iconData),
          ):const SizedBox()
        ],
      ));
}