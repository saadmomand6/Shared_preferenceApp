import 'package:flutter/material.dart';
import 'package:shared_preferenceapp/chairmanscreen.dart';
import 'package:shared_preferenceapp/studentscreen.dart';
import 'package:shared_preferenceapp/teacherscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
const List<String> roleList = [
  'student',
  'teacher',
  'chairman',
];
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   String selectedrole = 'chairman';
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final agecontroller = TextEditingController();
  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String roletype in roleList) {
      var newItem = DropdownMenuItem(
       
        value: roletype,
        child: Text(roletype,textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                        )),
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
       style: const TextStyle(
                  
                         ),
                         dropdownColor: Colors.white,
                        underline: Container(
                          height: 1,
                        color: Colors.grey,
                         ),
                         icon: const Icon(
                           Icons.arrow_drop_down,
                           color: Colors.black,
                        ),
      value: selectedrole,
      
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedrole = value.toString();
           
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Login page",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailcontroller,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: passwordcontroller,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: agecontroller,
              decoration: const InputDecoration(
                hintText: "Age",
              ),
            ),
            const SizedBox(height: 20,),
             Container(
              width: double.infinity,
            height: 50,
            child: androidDropdown(),
           
          ),
            const SizedBox(height: 40,),
            InkWell(
              onTap: () async{
                SharedPreferences sp =await SharedPreferences.getInstance();
                sp.setString('email', emailcontroller.text.toString());
                sp.setString('age', agecontroller.text.toString());
                sp.setString('usertype', selectedrole);
                sp.setBool('islogined', true);
                if(sp.getString('usertype') == 'student') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentScreen()));
                }else if(sp.getString('usertype') == 'teacher'){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TeacherScreen()));
                }else if(sp.getString('usertype') == 'chairman'){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ChairmanScreen()));
                }
                
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.purple,
                child: const Center(child: Text("Login" ,style: TextStyle(color: Colors.white),),),
              ),
            )
          ],
        ),
      ),
    );
  }
}