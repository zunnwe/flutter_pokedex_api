import 'package:pokedex_flutter/data/pokemon_page_response.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonInLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final List<PokemonListing> pokemonListing;
  final bool canLoadNextPage;
  PokemonLoaded({required this.pokemonListing, required this.canLoadNextPage});
}

class PokemonFailed extends PokemonState {
  final Error e;
  PokemonFailed({required this.e});
}
