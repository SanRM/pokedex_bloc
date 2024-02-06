import 'dart:convert';

import 'package:pokedex_bloc/remote/api_base_helper.dart';
import 'package:pokedex_bloc/remote/model/pokemon_response.dart';

class ApiProvider {
  final ApiBaseHelper _helper = ApiBaseHelper();

  late List<Results> response;

  Future<List<Results>> fetchPokemons({int offset = 0, int limit = 40}) async {
    try {

      final path = 'pokemon/?offset=$offset&limit=$limit';
      final responseString = await _helper.get(path);
      
      final responseJson = jsonDecode(responseString);
      response = PokemonResponse.fromJson(responseJson).results;
      
      // response = [
      //   Results(name: 'Pikachu', url: 'https://pokeapi.co/api/v2/pokemon/25'),
      // ];
      
    } catch (e) {
      print('error | $e');
    }

    return response;
  }
}
