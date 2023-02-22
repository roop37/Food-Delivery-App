import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/autocomplete/autocomplete_bloc.dart';

class LocationSearchBox extends StatelessWidget {
  const LocationSearchBox({
    Key?key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutocompleteBloc, AutocompleteState>(
      builder: (context, state) {
        if(state is AutocompleteLoading){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(state is AutocompleteLoaded){
          return Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter your location",
                  suffixIcon: const Icon(Icons.search),
                  contentPadding:
                  const EdgeInsets.only(left: 20, bottom: 5, top: 5),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white,)
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white)
                  )
              ),
              onChanged:(value){
                    context.read<AutocompleteBloc>().
                    add(LoadAutocomplete(searchInput: value));
                  },
            ),
          );
        }
        else{
          return Text('Something Went Wrong');
        }
      },
    );
  }
}