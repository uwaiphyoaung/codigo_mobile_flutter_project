import 'package:codigo_project/auth/widget/btn.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../general/widget/decoration.dart';
import '../util/text_style.dart';
import '../util/util_validate.dart';
import 'widget/gender_widget.dart';

class SignupScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SignupState();

}

class SignupState extends State<SignupScreen>{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateController = TextEditingController()..text= "DD/MM/YYYY";
  final TextEditingController nationController = TextEditingController();
  final TextEditingController residenceController = TextEditingController();
  final TextEditingController genderController = TextEditingController()..text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 15,right: 15, top: 60, bottom: 25),
                                  color: Colors.grey.shade200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Almost there!", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                      SizedBox(height: 10,),
                                      Text("Complete the form below to create your Ready To Travel account."),
                                      SizedBox(height: 15,),
                                      Text("* Mandatory", style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 15,right: 15, top: 20, bottom: 15),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextFormField(
                                          controller: firstNameController,
                                          keyboardType: TextInputType.text,
                                          style: AppTextStyles.mediumBlackTextStyle,
                                          textCapitalization: TextCapitalization.words,
                                          validator: (value) {
                                            return UtilValidate.validateBasic(value);
                                          },
                                          decoration: buildInputDecoration(
                                              "Enter First Name", "First Name",
                                              isMandatory: true),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: lastNameController,
                                          keyboardType: TextInputType.text,
                                          style: AppTextStyles.mediumBlackTextStyle,
                                          textCapitalization: TextCapitalization.words,
                                          validator: (value) {
                                            return UtilValidate.validateBasic(value);
                                          },
                                          decoration: buildInputDecoration(
                                              "Enter Last Name", "Last Name",
                                              isMandatory: true),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: emailController,
                                          keyboardType: TextInputType.text,
                                          style: AppTextStyles.mediumBlackTextStyle,
                                          validator: (value) {
                                            return UtilValidate.validateEmail(value);
                                          },
                                          decoration: buildInputDecoration(
                                              "Enter Email address", "Email address",
                                              isMandatory: true),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: Container(
                                                child: Stack(
                                                  children: [
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () async{
                                                          DateTime? date = DateTime(1900);
                                                          FocusScope.of(context).requestFocus(new FocusNode());

                                                          date = await showDatePicker(
                                                              context: context,
                                                              initialDate:DateTime.now(),
                                                              firstDate:DateTime(1900),
                                                              lastDate: DateTime(2100));
                                                          DateFormat formater = new DateFormat("dd/MM/yyyy");
                                                          dateController.text = formater.format(date!);},
                                                        child: AbsorbPointer(
                                                          child: TextFormField(
                                                              validator: (value) {
                                                                return UtilValidate.validateDate(value);
                                                              },
                                                              controller: dateController,
                                                              decoration: buildInputDecoration(
                                                                  "Choose Date of Birth", "Date of Birth",
                                                                  isMandatory: true)),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.centerRight,
                                                      child: Container(
                                                        width: 60,
                                                        height: 75,
                                                        child: Image.asset("assets/images/dob.png"),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            Expanded(
                                              flex: 4,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(35),
                                                  color: Colors.grey.shade300,
                                                ),
                                                child: GenderWidget(genderController),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: nationController,
                                          keyboardType: TextInputType.text,
                                          style: AppTextStyles.mediumBlackTextStyle,
                                          textCapitalization: TextCapitalization.words,
                                          validator: (value) {
                                            return UtilValidate.validateBasic(value);
                                          },
                                          decoration: buildInputDecoration(
                                              "Enter Your Nationality", "Nationality",
                                              isMandatory: true),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: residenceController,
                                          keyboardType: TextInputType.text,
                                          style: AppTextStyles.mediumBlackTextStyle,
                                          textCapitalization: TextCapitalization.words,
                                          validator: (value) {
                                            return UtilValidate.validateBasic(value);
                                          },
                                          decoration: buildInputDecoration(
                                              "Enter Country of residence", "Country of Residence",
                                              isMandatory: true),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10, left: 10),
                                          child: Text("Mobile no (Optional)", style: TextStyle(color: Colors.grey,fontSize: 12),),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: CountryPickerDropdown(
                                                initialValue: 'in',
                                                itemBuilder: (Country country){
                                                  return Container(
                                                    child: Text("+${country.phoneCode}"),
                                                  );
                                                },
                                                onValuePicked: (Country country) {
                                                  print("${country.phoneCode}");
                                                },
                                              ),
                                            ),
                                            Container(
                                              child: Expanded(
                                                child: TextField(
                                                  controller: phoneController,
                                                  keyboardType: TextInputType.phone,
                                                  style: AppTextStyles.mediumBlackTextStyle,
                                                  decoration: InputDecoration(
                                                    hintText: "Mobile number",
                                                    enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.grey),
                                                    ),
                                                    focusedBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.grey),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 65,)
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 100),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(),
                                  Container(
                                    width: 120,
                                    height: 150,
                                    child: Image.asset("assets/images/guitar.png"),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5,left: 15,right: 15),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.only(top: 5, bottom: 5,left: 15,right: 15),
                        color: Colors.white,
                        child: btn("Create my account now",Colors.blue.shade500,(){
                            if (_formKey.currentState!.validate()) {

                            }
                        },),
                      ),
                    ),
                  )
                ],
              ),
            ),
            IconButton(
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
                ))
          ],
        ),
      )
    );
  }

}