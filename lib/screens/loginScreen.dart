
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../util/util.dart';

String email1='',pass1='';
class LoginScreen extends StatelessWidget{
  static const String routeName ='/loginpage';

  static Route route(){
    return MaterialPageRoute(
        builder: (_)=>LoginScreen(),
        settings: RouteSettings(name: routeName)
    );
  }
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background 1.jpg'),
          fit: BoxFit.cover
        )
      ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.70,top: MediaQuery.of(context).size.height*0.055),
            child: Text('Food.io',style: logo1(),)),
          Container(
            padding: EdgeInsets.only(left: 37,top: 130),
            child: Text('Welcome\nBack, Foodie',style:heading1()),
          ),
          Container(
            padding: EdgeInsets.only(left: 37,top: 235),
            child: Text('Feeling hungry?',style:heading2()),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.35,right: 35,left: 35),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.14),
                    child: TextField(
                      onChanged: (value){
                        email1=value;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.purple.shade100,
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    onChanged: (value){
                      pass1=value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.purple.shade100,
                        filled: true,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(height: 10),
                  Column(

                    children: [
                      TextButton(child: Text('Log in',style: click1(),),
                        onPressed: () async {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .signInWithEmailAndPassword(
                                email: email1, password: pass1);
                            Navigator.pushNamed(context, '/location');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }
                        },
                          ),
                      TextButton(
                        child: Text('Forgotten password',style: click3(),),
                        onPressed: (){},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.89),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Dont have an account?'),
                  TextButton(child: Text('Sign Up',style: click2(),),
                  onPressed: (){
                    Navigator.pushNamed(context, '/create');
                  },
                  )
                ],
              ),
            )
          )
        ],

      ),
    ),
    );
  }
}


// onPressed: (){
//   Navigator.pushNamed(context, '/usernotfound');
// },