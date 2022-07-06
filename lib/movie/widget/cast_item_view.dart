import 'package:flutter/material.dart';

import '../../general/widget/image_view.dart';

class CastItemView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 130,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ImageView(
                  url: "https://static.wikia.nocookie.net/playstation/images/9/9f/Kristen_Bell.jpg",
                  alignment: Alignment.center,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10,),
              Text("India Menzel sgsagsag  ggh ghsad", style: TextStyle(color: Colors.black87,fontSize: 15), maxLines: 3, overflow: TextOverflow.ellipsis,)
            ],
          ),
        ),
      ),
    );
  }

}