import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodbash/util/util.dart';
import 'package:flutter/material.dart';
 String email='',pass='';
class CreateScreen extends StatelessWidget{
  static const String routeName ='/create';
  const CreateScreen({Key? key}) : super(key: key);


  static Route route(){
    return MaterialPageRoute(
        builder: (_)=>const CreateScreen(),
        settings: const RouteSettings(name: routeName)
    );
  }
  @override
  Widget build(BuildContext context){

    return Container(
      decoration: const BoxDecoration(
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
              padding: EdgeInsets.only(left: 16,top: 175),
              child: Text('Lets create your \nAccount ; )',style:heading1()),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.35,right: 35,left: 35),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.14),
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.purple.shade100,
                            filled: true,
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onChanged: (value){
                          email=value;
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.purple.shade100,
                          filled: true,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onChanged: (value){
                        pass=value;
                      },
                    ),
                    SizedBox(height: 40),
                    Column(

                      children: [
                        TextButton(child: Text('Sign up',style: click1(),),
                            onPressed: () async {
                              try {
                                Navigator.pushNamed(context, '/loginpage');
                                UserCredential userCredential = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                    email: email, password: pass);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print('The account already exists for that email.');
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}


// onPressed: (){
//   Navigator.pushNamed(context, '/usernotfound');
// },