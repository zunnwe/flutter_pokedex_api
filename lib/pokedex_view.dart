import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter/nav_cubit.dart';
import 'package:pokedex_flutter/pokemon_bloc.dart';
import 'package:pokedex_flutter/pokemon_state.dart';

class PokedexView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokedex"),
        ),
        body: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is PokemonInLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PokemonLoaded) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => BlocProvider.of<NavCubit>(context)
                        .getpokemonDetails(state.pokemonListing[index].id),
                    child: Card(
                        child: GridTile(
                            child: Column(
                      children: [
                        Image.network(
                          state.pokemonListing[index].imageUrl,
                          width: 70,
                          height: 70,
                        ),
                        Text(state.pokemonListing[index].name)
                      ],
                    ))),
                  );
                },
                itemCount: state.pokemonListing.length,
              );
            } else if (state is PokemonFailed) {
              return Center(
                child: Text(state.e.toString()),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
