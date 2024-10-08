import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/service/consumir_api.dart';


class PokemonPorvider with ChangeNotifier{
  List<Pokemon> _pokemons = [];
  bool _isLoading = true;


  List<Pokemon> get pokemons => _pokemons;
  bool get isLoading => _isLoading;

  final PokeApiService _apiService = PokeApiService();

  Future<void> fetchPokemons(int limit) async {
    _isLoading = true;
    notifyListeners();
    try{
      _pokemons = await _apiService.fetchPokemons(limit);
    }catch(error){
      print('No se pudieron cargar los datos: $error');
    }
    _isLoading = false;
    notifyListeners();
  }
}