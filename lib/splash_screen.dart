import 'dart:async';
//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:shared_pref_in/home_screen.dart';
import 'package:shared_pref_in/login_screen.dart';
import 'package:shared_pref_in/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isLogIn();

  }

  void isLogIn() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogIn = sp.getBool('isLogin') ?? false; // If isLogIn is null then we can say its false
    String userType = sp.getString('userType') ?? '';
    if(isLogIn)
      {
        if(userType == 'student')
         {
            print('done');
            Timer(Duration(seconds: 5), () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => studentScreen() ));
            });
          }
        else if (userType == 'teacher')
          {
            Timer(Duration(seconds: 5), () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => studentScreen() ));
            });
          }
        else
          {
            Timer(Duration(seconds: 5), () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LogInScreen() ));

            });
          }
      }
    else
      {
        Timer(Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LogInScreen() ));

        });
      }

  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fill,
        image: NetworkImage('https://images.pexels.com/photos/9866754/pexels-photo-9866754.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),),
    );
  }
}
