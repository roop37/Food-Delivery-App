import 'package:flutter/material.dart';
import 'package:foodbash/models/food_model.dart';
import 'package:foodbash/widgets/custom_bottom_navigation_bar.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite",style:const TextStyle(color: Colors.purple),),
        backgroundColor: Colors.purpleAccent.withOpacity(0.3),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: const customBottomNavigationBar(selectMenu: MenuState.favourite),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: ListView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics:const ScrollPhysics(),
              itemCount: 3,
                itemBuilder: (context,index)=>FavouriteCard(product: foodProducts[index], press: () {  },))
          ],
        ),
      ),),

    );

  }
}

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
    super.key, required this.product, required this.press,
  });
  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
      child: InkWell(
        onTap: press,
        child: Container(
          padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.purpleAccent.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(product.image,height: 100,width: 100,fit: BoxFit.cover,),
                ],
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title,style:
                    const TextStyle(
                        fontSize: 18,fontWeight: FontWeight.bold,
                        color: Colors.purple),),
                    Text(foodProducts[0].description,maxLines: 2,style:
                    const TextStyle(
                        fontSize: 15,fontWeight: FontWeight.w500,
                        color: Colors.white, )),

                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$${product.price}",style:
                        const TextStyle(
                          fontSize: 15,fontWeight: FontWeight.bold,
                          color: Colors.purple, )),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child:const Text("Remove",maxLines: 2,style:
                           TextStyle(
                            fontSize: 13,fontWeight: FontWeight.w500,
                            color: Colors.white, )),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}
