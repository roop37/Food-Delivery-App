

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodbash/blocs/geolocation/geolocation_bloc.dart';
import 'package:foodbash/config/theme.dart';
import 'package:foodbash/repositories/geoloaction/geo_location_repository.dart';
import 'package:foodbash/repositories/places/places_repository.dart';
import 'package:foodbash/screens/screens.dart';

import 'blocs/autocomplete/autocomplete_bloc.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context){
     return MultiRepositoryProvider(
       providers: [
         RepositoryProvider<GeolocationRepository>(
             create: (_)=> GeolocationRepository()),
         RepositoryProvider<PlaceRepository>(
             create: (_)=> PlaceRepository())
       ],
       child: MultiBlocProvider(
         providers: [
           BlocProvider(create: (context) => GeolocationBloc(geolocationRepository:
           context.read<GeolocationRepository>())
             ..add(LoadGeolocation())),
           BlocProvider(create: (context) => AutocompleteBloc(placeRepository:
           context.read<PlaceRepository>())
             ..add(LoadAutocomplete()))
         ],
         child: MaterialApp(
         debugShowCheckedModeBanner: false,
         title: 'Food.io',
         theme: theme(),
         onGenerateRoute: AppRouter.onGenerateRoute,
         initialRoute: LoginScreen.routeName,
     ),
       ),);

  }
}
