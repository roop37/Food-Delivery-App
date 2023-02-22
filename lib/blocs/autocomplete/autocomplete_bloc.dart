import 'dart:async';
import 'package:foodbash/models/place_autocomplete_model.dart';
import 'package:foodbash/repositories/places/places_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
//import 'package:foodbash/models/place_autocomplete_model.dart';

part 'autocomplete_event.dart';
part 'autocomplete_state.dart';

class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState> {
  final PlaceRepository _placeRepository;
  StreamSubscription? _placeSubscription;

  AutocompleteBloc({required PlaceRepository placeRepository})
        :_placeRepository=placeRepository,
        super(AutocompleteLoading());


  @override
    Stream<AutocompleteState> mapEventToState(
    AutocompleteEvent event,
  ) async*{
    if(event is LoadAutocomplete){
      yield* _mapLoadAutocompleteToState(event);
  }
}
Stream<AutocompleteState> _mapLoadAutocompleteToState(
    LoadAutocomplete event) async*{
  _placeSubscription?.cancel();


    final List<PlaceAutocomplete> autocomplete=await _placeRepository.getAutocomplete(event.searchInput);
      yield AutocompleteLoaded(autocomplete: autocomplete);
  }
}
