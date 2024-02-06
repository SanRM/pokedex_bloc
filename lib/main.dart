import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_bloc/pages/app.dart';

import 'bloc/pokemons_bloc.dart';
import 'repository/pokemon_repository.dart';

void main() {

  PokemonRepository pokemonRepository = PokemonRepository();

  runApp(
    MultiBlocProvider(

      providers: [
        BlocProvider<PokemonsBloc>(
          create: (BuildContext context) => PokemonsBloc(pokemonRepository: pokemonRepository),
        )
      ],

      child: const MyApp(),

    ),
  );
}
