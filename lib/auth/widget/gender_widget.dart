import 'package:codigo_project/util/app_color.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatefulWidget {
  late TextEditingController genderController;
  GenderWidget(this.genderController,{Key? key}) : super(key: key);

  @override
  State<GenderWidget> createState() => _GenderWidgetState(genderController);
}

class _GenderWidgetState extends State<GenderWidget> {
  late TextEditingController genderController;
  int selectedGender = 1;


  _GenderWidgetState(this.genderController);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: buildGenderWidget(
              context,
              "Male",
              index: 2),
        ),
        Expanded(
          child: buildGenderWidget(
              context,
              "Female",
              index: 3),
        ),
      ],
    );
  }

  Widget buildGenderWidget(BuildContext context, String name,
      {required int index}) {
    return InkWell(
      onTap: (){
        setState(() {
          selectedGender = index;
          switch(index){
            case 2: genderController.text = "Male";
            break;
            case 3: genderController.text = "Female";
            break;
          }
        });
      },
      child: Container(
        decoration: index == selectedGender?
        BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.white,
            border: Border.all(color: AppColors.primaryColor)
        )
            : BoxDecoration(),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
            child: Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}
