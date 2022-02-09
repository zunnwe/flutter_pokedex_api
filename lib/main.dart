import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter/app_navigator.dart';
import 'package:pokedex_flutter/nav_cubit.dart';
import 'package:pokedex_flutter/pokedex_view.dart';
import 'package:pokedex_flutter/pokemon_bloc.dart';
import 'package:pokedex_flutter/pokemon_detail_cubit.dart';
import 'package:pokedex_flutter/pokemon_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final pokemonDetailCubit = PokemonDetailCubit();
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    PokemonBloc()..add(PokemonPageRequest(page: 0))),
            BlocProvider(
                create: (context) =>
                    NavCubit(pokemonDetailCubit: pokemonDetailCubit)),
            BlocProvider(create: (context) => pokemonDetailCubit)
          ],
          child: AppNavigator(),
        ));
  }
}
