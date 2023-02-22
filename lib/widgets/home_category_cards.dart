import 'package:flutter/cupertino.dart';

import 'home_category_list.dart';

class Categorycard extends StatelessWidget {
  const Categorycard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryList(press: () {  }, title: 'Restaurants',),
          CategoryList(press: () {  }, title: 'Coffee Shop',),
          CategoryList(press: () {  }, title: 'Italian Shop',),
          CategoryList(press: () {  }, title: 'Salad Shop',),
        ],
      ),
    );
  }
}

