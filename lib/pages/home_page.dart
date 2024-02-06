import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_bloc/bloc/pokemons_bloc.dart';
import 'package:pokedex_bloc/repository/pokemon_repository.dart';

import '../remote/model/pokemon_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokemonRepository pokemonRepository = PokemonRepository();

  late PokemonsBloc pokeBloc =
      PokemonsBloc(pokemonRepository: pokemonRepository);

  bool scrollSwitch = true;

  @override
  Widget build(BuildContext context) {
    pokeBloc = BlocProvider.of<PokemonsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Poke App', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<PokemonsBloc, PokemonsState>(
      bloc: pokeBloc,
      builder: (context, state) {
        if (state is WithoutPokemonsState) {
          pokeBloc.add(AddMorePokemons());
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is WithPokemonsState) {
          scrollSwitch = true;
          return _list(state);
        }
        return Container();
      },
    );
  }

  Widget _list(WithPokemonsState state) {
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          scrollSwitch == true) {
        scrollSwitch = false;
        pokeBloc.add(AddMorePokemons());
      }
    });

    return ListView.builder(
      controller: scrollController,
      itemCount: state.pokemons.length,
      itemBuilder: (BuildContext context, int index) {
        return _listTile(state.pokemons, index);
      },
    );
  }

  Widget _listTile(List<Results> pokemons, int index) {
    final chunks = pokemons[index].url.split('/');
    var id = chunks[6];
    return ListTile(
      leading: Icon(Icons.pets, color: const Color.fromARGB(255, 244, 54, 86)),
      title: Text(pokemons[index].name),
      subtitle: Text('Pokemon ID: $id'),
      trailing: Image(
        image: NetworkImage(
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${id}.png',
        ),
      ),
    );
  }
}
