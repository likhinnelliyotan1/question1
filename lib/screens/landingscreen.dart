import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:question1/helper/borders.dart';
import 'package:question1/helper/buttons.dart';
import 'package:question1/helper/themedata.dart';
// import 'package:question1/helper/themedata.dart';
import 'package:question1/models/availabledays.dart';
import 'package:question1/models/days.dart';
import 'package:question1/models/slots.dart';
import 'package:question1/notifiers/update_notifier.dart';
import 'package:question1/repo/timerrepo.dart';
import 'package:question1/screens/launchscreen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<LandingScreen> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding:
          const EdgeInsets.only(left: 10, right: 10,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const  Text(
                "Name",
                style: TextStyle(
                    color: Colors.black, fontSize: 14),
              ),
              const SizedBox(height: 6,),
              nameField(),
              const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  saveData();
                },
                child: commonButton(name: "Continue",bg:colorPrimary,width: MediaQuery.of(context).size.width-20),
              )

            ],
          ),
        ),
      ),
    );
  }

  late String name;
  final GlobalKey<FormState> _mainKey = GlobalKey();
  saveData()
  {
    if(_mainKey.currentState!.validate())
    {
      _mainKey.currentState!.save();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (BuildContext context) => LaunchScreen(name: name,)));
    }

    //var jsonData=Days().toJson();

  }
  nameField()
  {
    return Container(
      height: 45,
      decoration:getBorder(color: colorPrimary,bgColor: Colors.white),
      child: Form(
        key: _mainKey,
        child: TextFormField (

          // controller: _textEditingControllerPhone,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelStyle: TextStyle(
              fontSize: 14,
            ),

            focusColor: colorPrimary,
            hintStyle: TextStyle(fontSize: 14),
            contentPadding:
            EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            hintText: "Name",
            border:  InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
          ),
          validator: (value) {
            if (value!.trim().isEmpty) {
              return "This Field is required";
            } else {
              return null;
            }
          },
          onSaved: (value) {
           name=value!;
          },
        ),
      ),
    );
  }
}
