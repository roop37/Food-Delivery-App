import 'package:geolocator/geolocator.dart';
import 'package:foodbash/repositories/geoloaction/base_geolocationrepository';

class GeolocationRepository extends BaseGeolocationRepository{
  GeolocationRepository();
  @override
  Future<Position> getCurrentLocation() async{
    return await Geolocator.getCurrentPosition(
      desiredAccuracy:LocationAccuracy.high
    );
  }
}