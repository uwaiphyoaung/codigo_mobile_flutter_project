import 'package:codigo_project/movie/presenter/movie_presenter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ErrorView extends StatelessWidget{
  final String type;
  final int id;

  ErrorView(this.type, this.id);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: Container(
              padding: EdgeInsets.only(left: 20,right:20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(type=="internet"?FontAwesomeIcons.plug:FontAwesomeIcons.powerOff, size: 50,),
                  SizedBox(height: 20,),
                  Text(type=="internet"?"Internet connection lost":"Server Error", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10),
                  Text(type=="internet"?"Your client computer is having network issues. Restart your modem and/or router at the host computer's location.":"Server is under maintenance. Please try again later." , textAlign: TextAlign.center,),
                  SizedBox(height: 20,),
                  TextButton(
                    onPressed: () {
                      MoviePresenter().findMovieDetail(context, id);
                    },
                    child: Text("Retry", style: TextStyle(fontSize: 18),),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                              (Set<MaterialState> states) {
                            return EdgeInsets.only(left: 22,right: 12,  top: 7, bottom: 7);
                          },
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            )
                        )
                    ),)
                ],
              ),
            )
        ),
        Padding(
          padding: EdgeInsets.only(top: 40,right: 15),
          child: IconButton(
              onPressed: ()
              {
                Navigator.of(context).pop();
              },
              icon: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: 35,
                child: Center(
                  child: Icon(Icons.chevron_left, color: Colors.black,),
                ),
              )),
        )
      ],
    );
  }

}