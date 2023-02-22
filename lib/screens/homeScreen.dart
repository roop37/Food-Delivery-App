import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/food_model.dart';
import '../util/util.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/food_product.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_category_cards.dart';
import '../widgets/home_category_list.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(builder: (_) => HomeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent.shade100,
      bottomNavigationBar: customBottomNavigationBar(selectMenu: MenuState.home,),
      body: SafeArea(
        child: ListView(
          children: [
          CustomAppBar(),
          SizedBox(height: 20,),
          Categorycard(),
           Padding(
             padding: EdgeInsets.all(8.0),
             child: Text('Popular Food',style:const TextStyle(
                  color: Colors.black54,fontSize: 20,
                  fontWeight: FontWeight.bold)
              ),
           ),
            FoodCard(),

        ],),
      ),
    );
  }
}

