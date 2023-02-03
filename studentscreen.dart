import 'package:flutter/material.dart';
import 'package:shared_preferenceapp/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  String email = '';
  String age = '';
  String type = '';
  @override
  void initState() {
    super.initState();
    loadData();
  }
  void loadData() async{
    SharedPreferences sp =await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    type = sp.getString('usertype') ?? '';
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Student View",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const Text("our home screen"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Email"),
                Text(email),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Age'),
                Text(age),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Type'),
                Text(type.toString()),
              ],
            ),
             const SizedBox(height: 40,),
              InkWell(
                onTap: () async{
                  SharedPreferences sp =await SharedPreferences.getInstance();
                  sp.clear();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.purple,
                  child: const Center(child: Text("LogOut" ,style: TextStyle(color: Colors.white),),),
                ),
              )],
        ),
      ),
    
    );
  }
}