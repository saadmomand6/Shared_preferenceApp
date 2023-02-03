import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferenceapp/loginscreen.dart';
import 'package:shared_preferenceapp/studentscreen.dart';
import 'package:shared_preferenceapp/teacherscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chairmanscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checklogin();
  }
  void checklogin()async{
    SharedPreferences sp =await SharedPreferences.getInstance();
    bool islogin = sp.getBool('islogined') ?? false;
    String userType = sp.getString("usertype") ?? "";

    if(islogin){
      if (userType == "student") {
         Timer(const Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentScreen()));
    });
      }else if(userType == "teacher"){
 Timer(const Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const TeacherScreen()));});
      }else if(userType == "chairman"){
 Timer(const Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ChairmanScreen()));});
      }
      
    }else{
       Timer(const Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));});
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Text("Shared Prefference App",style: TextStyle(color: Colors.white,fontSize: 30),)),
        ],
      ),
    );
  }
}