import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodbash/screens/detailScreen.dart';

import '../models/food_model.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: foodProducts.length,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ), itemBuilder:(context,index)=>FoodProduct(press: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>DetailScreen(foodDetail: foodProducts[index]))
            );

      }, product: foodProducts[index],)),
    );
  }
}

class FoodProduct extends StatelessWidget {
  const FoodProduct({
    super.key, required this.product, required this.press,
  });
  final Product product;
  final  VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.purple.shade700.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image),
            Text(product.title,style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Row(
              children: [

                Text("\$${product.price}",style:const TextStyle( color: Colors.purple,fontSize: 14,fontWeight: FontWeight.bold),),
                const Spacer(),
                const SizedBox(height: 10,),
                const Icon(Icons.star,color: Colors.yellow,size: 20,),
                Text(
                  "${product.rating}",
                  style:const TextStyle(color: Colors.yellow,fontSize: 14),),
              ],
            )
          ],
        ),
      ),
    );
  }
}

