import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Gmap extends StatelessWidget{
  final double lat;
  final double lng;

  const Gmap({
    Key? key,
    required this.lat,
    required this.lng,
}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(
              10,
              10,
            ),
            zoom: 10),
      ),
    );
  }
}