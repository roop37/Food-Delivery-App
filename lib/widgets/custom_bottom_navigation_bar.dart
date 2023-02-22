import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodbash/screens/cartScreen.dart';
import 'package:foodbash/screens/favouriteScreen.dart';
import 'package:foodbash/screens/homeScreen.dart';

enum MenuState {profile,home,favourite,cart}

class customBottomNavigationBar extends StatelessWidget {
  const customBottomNavigationBar({
    super.key, required this.selectMenu,
  });
  final MenuState selectMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius:const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          boxShadow: [BoxShadow(color: Colors.purple.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 7
          )]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
          }, icon:const Icon(Icons.home_outlined),
            color:MenuState.home==selectMenu ? Colors.white : Colors.grey,
            iconSize: 30,),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const FavouriteScreen()));},
            icon:const Icon(Icons.favorite_outline),
            color:MenuState.favourite==selectMenu ? Colors.white : Colors.grey,
            iconSize: 30,),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
          }, icon:const Icon(Icons.shopping_cart_outlined),
            color:MenuState.cart==selectMenu ? Colors.white : Colors.grey,
            iconSize: 30,),
          IconButton(onPressed: (){}, icon:const Icon(Icons.person_outline),
            color:MenuState.profile==selectMenu ? Colors.white : Colors.grey,
            iconSize: 30,)
        ],
      ),
    );
  }
}

