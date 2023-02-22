
import 'package:flutter/material.dart';


class UserNotFound extends StatelessWidget{
  static const String routeName ='/usernotfound';

  static Route route(){
    return MaterialPageRoute(
        builder: (_)=>UserNotFound(),
        settings: RouteSettings(name: routeName)
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('user not found')),
      body: ElevatedButton(
        child: Text('create account'),
        onPressed: (){
          Navigator.pushNamed(context, '/loginpage');
        },
      ),
    );
  }
}
