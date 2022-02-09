import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter/pokemon_event.dart';
import 'package:pokedex_flutter/data/pokemon_repo.dart';
import 'package:pokedex_flutter/pokemon_state.dart';
import 'package:pokedex_flutter/data/pokemon_page_response.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepo = PokemonRepository();

  PokemonBloc() : super(PokemonInitial());

  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is PokemonPageRequest) {
      yield PokemonInLoading();

      try {
        final pokemonPageResponse =
            await _pokemonRepo.getPokemonPage(event.page);
        yield PokemonLoaded(
            pokemonListing: pokemonPageResponse.pokemonListing,
            canLoadNextPage: pokemonPageResponse.canLoadNextPage);
      } catch (e) {
        yield PokemonFailed(e: e as Error);
      }
    }
  }
}
