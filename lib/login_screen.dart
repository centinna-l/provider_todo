


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/main.dart';
import 'package:flutter_state_management/signup_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_management/item_list_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool _loading = false;
  GlobalKey<FormState> validatingKey = GlobalKey();

  @override
  void initState(){
    checkUserExist();
    super.initState();
  }

  checkUserExist()async{
  bool _userexist =  await Provider.of<StateProvider>(context, listen: false).tryAutoLogin();
  if(_userexist){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }
  }

  @override
  Widget build(BuildContext context) {
    return Form( key: validatingKey,
      child: Scaffold(
        body: Container(
            child:Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },controller: emailController,decoration: InputDecoration(fillColor: Colors.grey, hintText: "email", enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),),
                TextFormField(validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },controller: passwordController,decoration: InputDecoration( fillColor: Colors.grey,hintText: "password", enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),),
                SizedBox(height: 30,),
                Container(color: Colors.blue,child: TextButton( child: Text("Submit"),onPressed: onSubmit)),
                SizedBox(height: 80,),
                RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(
                          color: Colors.white, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(text: ' Sign up',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 18),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUP()),
                                );
                              }
                        )
                      ]
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
  Future<void>onSubmit()async {
    String _error="noerror";
    if(validatingKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });
      try {
        await Provider.of<StateProvider>(context, listen: false).login(
          emailController.text.toString(),
          passwordController.text.toString(),
        );
      } on HttpException catch(error){
        _error=error.toString();
        print(error);
        Fluttertoast.showToast(msg: error.toString(),toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM);
      }
      print( Provider.of<StateProvider>(context, listen:false).token);
      if(_error.contains('noerror')){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
      setState(() {
        _loading = false;
      });
    }

  }
}
