import 'package:carousel_slider/carousel_slider.dart';
import 'package:codigo_project/general/widget/image_view.dart';
import 'package:flutter/material.dart';

import '../../general/widget/custom_clipper.dart';

class PhotoGallery extends StatelessWidget{

  late List<String> imgList = [
    "https://www.kayak.de/rimg/himg/f8/51/ac/revato-4210-12497415-817761.jpg",
    "https://www.oyster.com/wp-content/uploads/sites/35/2019/05/pool-v10870900-1440-1024x683.jpg",
    "https://www.furama.com/factsheet/images/frf/courtyard.jpg",
    "https://www.dztraveler.com/wp-content/gallery/hotel-furama-riverfront/DSCF2407.jpg",
    "https://content.r9cdn.net/rimg/himg/f8/51/ac/revato-4210-12497448-065349.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
        height: 170.0,
        width: double.infinity,
        child: CarouselSlider.builder(
          options: CarouselOptions(
            enlargeCenterPage: false,
            aspectRatio: 1.1,
            viewportFraction: 1,
            initialPage: 0,
            autoPlay: true,
          ),
          itemCount: imgList.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              Stack(
                children: [
                  ImageView(
                    url: imgList[itemIndex],
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      color: Colors.black,
                      width: 80,
                      height: 40,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container (
                      child: ClipPath (
                        clipper: SlopeClipper(),
                        child: Container(
                          padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                          color: Colors.black,
                          child: Center(
                            child: Text("See All ${itemIndex+1}/${imgList.length}", style: TextStyle(color: Colors.white),),
                          ),
                          width: 120,
                          height: 40,
                        ),
                      ),
                    ),
                  )
                ],
              ),
        ));
  }

}