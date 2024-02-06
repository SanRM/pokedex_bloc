import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../remote/model/pokemon_response.dart';
import '../repository/pokemon_repository.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final PokemonRepository pokemonRepository;

  PokemonsBloc({required this.pokemonRepository}) : super(WithoutPokemonsState()) {

    on<AddMorePokemons>((event, emit) async {
        try {
          final pokemons = await pokemonRepository.fetchPokemons();
          emit(WithPokemonsState(pokemons: pokemons, amount: pokemons.length));
        } catch (error) {
          //print('error: $error');
        }
      },
    );

  }
}
