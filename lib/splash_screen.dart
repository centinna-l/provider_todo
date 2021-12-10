import 'package:flutter/material.dart';
import 'package:flutter_state_management/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

import 'item_list_provider.dart';
import 'main.dart';

class WelcomeScreen extends StatefulWidget {


  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
 bool _userexist=false;
  @override
  void initState() {
    // TODO: implement initState
           getlogin();
    super.initState();
  }
  getlogin()async{
       _userexist  =  await Provider.of<StateProvider>(context, listen: false).tryAutoLogin();
     print(_userexist);
  }
  @override
  Widget build(BuildContext context) {
    return  SplashScreen(
                        seconds: 5,
        title: new Text(
          'todo',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color:Colors.blue),
        ),
        navigateAfterSeconds:_userexist? Home():LoginScreen(),
      );
  }
}
