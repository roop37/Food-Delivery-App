import 'package:flutter/material.dart';
import 'package:foodbash/models/food_model.dart';

import '../constant.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class DetailScreen extends StatefulWidget {

  final Product foodDetail;

  const DetailScreen({Key? key, required this.foodDetail}) : super(key: key);

  static const String routeName = '/detail';


  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.foodDetail.title,style:const TextStyle(color: Colors.purple),),
        backgroundColor: Colors.purpleAccent.withOpacity(0.3),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar:const customBottomNavigationBar(selectMenu: MenuState.home,),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.4,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent.withOpacity(0.3),
                  borderRadius:const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)
                  )
                ),
                child: Image.asset(widget.foodDetail.image),
              ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            child: Column(
              children: [
                Text(widget.foodDetail.description,style:const TextStyle(
                    fontSize: 16,
                    color: Colors.purple
                ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Text("\$${widget.foodDetail.price}",style:const TextStyle( color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    const Spacer(),
                    const SizedBox(height: 10,),
                    const Icon(Icons.star,color: Colors.yellow,size: 20,),
                    Text(
                      "${widget.foodDetail.rating}",
                      style:const TextStyle(color: Colors.yellow,fontSize: 14),),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        height:45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:const Icon(Icons.remove),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    const Text('1',style: TextStyle(color: Colors.black,fontSize: 20),),
                    SizedBox(width: 8.0),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        height:45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:const  Icon(Icons.add),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25.0),
                MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  minWidth: double.infinity,
                  color: Colors.purple,
                  height: 40,
                  onPressed: (){},child: Text('Add To Cart',style: TextStyle(color: Colors.white,fontSize: 18),),)
              ],
            ),
          ),

          ],
        ),
      ),),
    );
  }
}
