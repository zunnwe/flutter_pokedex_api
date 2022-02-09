import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter/data/pokemon_detail.dart';
import 'package:pokedex_flutter/data/pokemon_info_response.dart';
import 'package:pokedex_flutter/data/pokemon_repo.dart';
import 'package:pokedex_flutter/data/pokemon_species_info.dart';
import 'string_extension.dart';

class PokemonDetailCubit extends Cubit<PokemonDetail> {
  final pokemonRepo = PokemonRepository();

  PokemonDetailCubit()
      : super(PokemonDetail(
            id: 0,
            name: "",
            imageUrl: "",
            types: [],
            weight: 0,
            height: 0,
            description: ""));

  void getPokemonDetail(int pokemonId) async {
    final response = await Future.wait([
      pokemonRepo.getPokemonInfo(pokemonId),
      pokemonRepo.getPokemonSpeciesInfo(pokemonId)
    ]);
    final pokemonInfo = response[0] as PokemonInfoResponse;
    final pokemonSpeciesInfo = response[1] as PokemonSpeciesInfo;
    emit(PokemonDetail(
        id: pokemonInfo.id,
        name: pokemonInfo.name.toString().inCaps,
        imageUrl: pokemonInfo.imageUrl,
        types: pokemonInfo.types,
        weight: pokemonInfo.weight,
        height: pokemonInfo.height,
        description: pokemonSpeciesInfo.description));
  }

  void clearPokemonDetail() {
    emit(PokemonDetail(
        id: 0,
        name: "",
        imageUrl: "",
        types: [],
        weight: 0,
        height: 0,
        description: ""));
  }
}
