import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter/data/pokemon_detail.dart';
import 'package:pokedex_flutter/pokemon_detail_cubit.dart';
import 'string_extension.dart';

class PokemonDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      body: BlocBuilder<PokemonDetailCubit, PokemonDetail>(
        builder: (context, detail) {
          return detail != ""
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Image.network(
                            detail.imageUrl,
                            width: 80,
                            height: 80,
                          ),
                          Text(
                            detail.name,
                            style: TextStyle(
                                color: Colors.blueGrey[400],
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text("Weight: ${detail.weight}"),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text("Height: ${detail.height}"),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              detail.description,
                              textAlign: TextAlign.center,
                            )))
                  ],
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
