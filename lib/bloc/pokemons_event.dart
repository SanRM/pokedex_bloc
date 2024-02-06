part of 'pokemons_bloc.dart';

@immutable
sealed class PokemonsEvent extends Equatable {

  const PokemonsEvent();

  @override
  List<Object> get props => [];

}

class AddMorePokemons extends PokemonsEvent {

  

}