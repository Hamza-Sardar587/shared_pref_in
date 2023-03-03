//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_pref_in/home_screen.dart';
import 'package:shared_pref_in/student_screen.dart';
import 'package:shared_pref_in/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Login')),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: ageController,
                decoration: InputDecoration(
                  hintText: 'Age',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: ()async{
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailController.text.toString());
                  sp.setString('age', ageController.text.toString());

                  sp.setString('userType', 'teacher');
                  sp.setBool('isLogin', true);
                  if(sp.getString('userTtpe') == 'student')
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => studentScreen() ));
                    }
                  else
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => teacherScreen() ));
                    }

                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.green,
                  child: Center(
                    child: Text('Log in'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
