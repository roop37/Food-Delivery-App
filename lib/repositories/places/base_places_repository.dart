import '../../models/place_autocomplete_model.dart';

abstract class BasePlacesRepository{
  Future<List<PlaceAutocomplete>?>getAutocomplete(String searchinput) async{

  }
}