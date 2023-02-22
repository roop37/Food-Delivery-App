
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodbash/blocs/geolocation/geolocation_bloc.dart';
import 'package:foodbash/util/util.dart';
import 'package:foodbash/widgets/gmap.dart';
import 'package:foodbash/widgets/location_search.dart';

import '../blocs/autocomplete/autocomplete_bloc.dart';



class LocationScreen extends StatelessWidget{
  static const String routeName='/location';

  static Route route() {
    return MaterialPageRoute(builder: (_) => LocationScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: BlocBuilder<GeolocationBloc, GeolocationState>(
            builder: (context, state) {
            if (state is GeolocationLoading){
              return Center(
                  child: CircularProgressIndicator(),
              );
            } else if(state is GeolocationLoaded){
              return Gmap(
                  lat: state.position.latitude,
                  lng: state.position.longitude
              );
            } else {
              return Text('Something Went wrong.');
                  }
                },
            ),
          ),
          Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Container(
                child: Row(
                  children: [
                    //Text('Food.io',style: logo1(),),
                    SizedBox(width: 10,),
                    Expanded(
                        child: Column(
                          children: [
                            LocationSearchBox(),
                            BlocBuilder<AutocompleteBloc, AutocompleteState>(
                              builder: (context, state){
                                if(state is AutocompleteLoading){
                                  return Center(child: CircularProgressIndicator());
                                }
                                else if(state is AutocompleteLoaded){
                                  return Container(
                                    margin: const EdgeInsets.all(8),
                                    height: 300,
                                    color: state.autocomplete.length>0
                                     ? Colors.black.withOpacity(0.6)
                                      :Colors.transparent,
                                    child: ListView.builder(
                                      itemCount: state.autocomplete.length,
                                      itemBuilder: (context,index){
                                        return ListTile(title:
                                        Text(state.autocomplete[index].description,
                                            style: click2()
                                        ),
                                        );
                                      }
                                    ),
                                  );
                                }
                                else{
                                  return Text('Something Wrong Happend');
                                }
                              }
                              )
                          ],
                        )),
                  ],
                ),
              )),
          Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70,),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent),
                  child: Text('Confirm Location',style: buttons2(),),
                onPressed: (){

                },
                ),
              )
          ),
          Positioned(
            bottom: 8,
            left: MediaQuery.of(context).size.width*0.39,
            child: Text('Food.io',style: logo2()),
          )
        ],
      ),
    );
  }

}

