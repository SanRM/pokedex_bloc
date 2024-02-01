

import 'package:pokedex_bloc/remote/api_base_helper.dart';
import 'package:pokedex_bloc/remote/model/pokemon_response.dart';

class ApiProvider {

  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Results>> fetchPokemons({int offset = 0, int limit = 20}) async {
    final path = 'pokemon?offset=$offset&limit=$limit';
    final response = await _helper.get(path);
    return PokemonResponse.fromJson(response).results!;
  }

}