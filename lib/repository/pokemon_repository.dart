import 'package:pokedex_bloc/remote/api_provider.dart';
import 'package:pokedex_bloc/remote/model/pokemon_response.dart';

class PokemonRepository {

  final ApiProvider _apiProvider = ApiProvider();
  List<Results> pokemons = [];
  int count = 0;

  Future<List<Results>> fetchPokemons() async {
      
    if (pokemons.isEmpty) {

      try {
        pokemons.addAll(await _apiProvider.fetchPokemons());
        count = pokemons.length;

        for (var pokemon in pokemons) {
          print('The pokemons are: ${pokemon.name}');
        }

      } catch (e) {
        //print('error in PokemonRepository | $e');
      }

      return pokemons;
    }

    pokemons.addAll(await _apiProvider.fetchPokemons(offset: count, limit: 20));
    count = pokemons.length;
    
    print('The pokemons are: $pokemons');

    return pokemons;

  }
}
