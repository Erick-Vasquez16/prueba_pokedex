import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/pokemon_prividers.dart';
import 'screens/lista_pokemon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonPorvider()..fetchPokemons(300),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: PokemonListScreen(),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
