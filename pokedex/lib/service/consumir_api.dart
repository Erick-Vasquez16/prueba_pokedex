import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';

class PokeApiService{
  static const String apiUrl = 'https://pokeapi.co/api/v2/pokemon';

  Future<List<Pokemon>> fetchPokemons(int limit) async{

    final response = await http.get(Uri.parse('$apiUrl?limit=$limit'));


    if(response.statusCode == 200){

      final List<dynamic> results = jsonDecode(response.body)['results'];

      return Future.wait(results.map((data) async {

        final detailResponse = await http.get(Uri.parse(data['url']));
        return Pokemon.fromJson(jsonDecode(detailResponse.body));

      }).toList());

    }else{

      throw Exception('Error al cargar los Pokemones');

    }
  }
}