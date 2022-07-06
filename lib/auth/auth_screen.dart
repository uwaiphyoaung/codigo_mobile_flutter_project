import 'package:codigo_project/auth/signup_screen.dart';
import 'package:codigo_project/auth/widget/btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AuthScreenState();

}

class AuthScreenState extends State<AuthScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/welcome.png",width: double.infinity,),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(),
                Image.asset("assets/images/clouds.png",width: double.infinity),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15,right: 15,bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome to \nReady To Travel",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, height: 1.4),),
                        const SizedBox(height: 10,),
                        Text("Sign up with Facebook for the most fulfilling trip planning experience with us!"),
                        const SizedBox(height: 20,),
                        btn("Login with Facebook", Colors. blue, (){}, hasIcon: true),
                        btn("Login with email address", Colors.blue, (){}, hasIcon: false),
                        btn("Create a new account", Colors.blue.shade300, (){
                          Get.to(()=> SignupScreen());
                        }, hasIcon: false),
                        const SizedBox(height: 20,),
                      ]
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}