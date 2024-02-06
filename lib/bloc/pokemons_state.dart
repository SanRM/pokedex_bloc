part of 'pokemons_bloc.dart';

@immutable
sealed class PokemonsState extends Equatable {

  const PokemonsState();

}

//This state could not have any attributes because it is the initial state
final class WithoutPokemonsState extends PokemonsState {

  final List<Results> pokemons = [];

  @override
  List<Object> get props => [pokemons];

}

final class WithPokemonsState extends PokemonsState {

  final List<Results> pokemons;
  final int amount;

  const WithPokemonsState({required this.pokemons, required this.amount}); 

  @override
  List<Object> get props => [pokemons];

}
