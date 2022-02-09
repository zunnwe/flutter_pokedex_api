import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter/pokemon_detail_cubit.dart';

class NavCubit extends Cubit<int> {
  final PokemonDetailCubit pokemonDetailCubit;
  NavCubit({required this.pokemonDetailCubit}) : super(0);

  void getpokemonDetails(int pokemonId) {
    pokemonDetailCubit.getPokemonDetail(pokemonId);
    emit(pokemonId);
  }

  void popToPokedex() {
    emit(0);
  }
}
