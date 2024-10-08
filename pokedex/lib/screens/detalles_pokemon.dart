import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonDetalles extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetalles({Key? key,required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemon.name.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.network(
                      pokemon.imageUrl,
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Types',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      SizedBox(height: 5),
                      Wrap(
                        spacing: 8.0,
                        children: pokemon.types
                            .map((type) => Chip(
                                  label: Text(type),
                                  backgroundColor: Colors.orangeAccent,
                                ))
                            .toList(),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Abilities',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      SizedBox(height: 5),
                      Wrap(
                        spacing: 8.0,
                        children: pokemon.abilities
                            .map((ability) => Chip(
                                  label: Text(ability),
                                  backgroundColor: Colors.lightBlueAccent,
                                ))
                            .toList(),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Base Stats',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      Divider(color: Colors.grey),
                      _buildStatRow('HP', pokemon.baseStats['hp'] ?? 0),
                      _buildStatRow('Attack', pokemon.baseStats['attack'] ?? 0),
                      _buildStatRow('Defense', pokemon.baseStats['defense'] ?? 0),
                      _buildStatRow('Speed', pokemon.baseStats['speed'] ?? 0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatRow(String statName, int statValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            statName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            width: 150,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[300],
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: statValue / 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          Text(
            statValue.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}