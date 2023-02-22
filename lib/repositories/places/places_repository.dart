import 'package:foodbash/repositories/places/base_places_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:foodbash/models/place_autocomplete_model.dart';


class PlaceRepository extends BasePlacesRepository{
  final String key='AIzaSyA6RI9m1MTL7iNHfR6aJPVK2BOswjYzZuM';
  final String types='geocode';
  Future<List<PlaceAutocomplete>>getAutocomplete(String searchinput) async{
    final String url='https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchinput&types=$types&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['predictions'] as List;

    return  results.map((place) => PlaceAutocomplete.fromJson(place)).toList();
  }
}