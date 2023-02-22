import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/util.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key, required this.title, required this.press,
  });
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: press,
        child: Chip(
            backgroundColor: Colors.purple.shade700,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            label: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(title,style: chip1(),))),
      ),
    );
  }
}

