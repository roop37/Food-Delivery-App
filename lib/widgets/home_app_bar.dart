import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/util.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu_rounded),
            onPressed: () {},
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.15,),
          Expanded(child: Container(
            padding: const EdgeInsets.only(left: 10),
            height: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      hintText: 'What are you looking for?',
                      hintStyle: type1(),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          )
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            width: 50,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.purpleAccent.shade400,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}