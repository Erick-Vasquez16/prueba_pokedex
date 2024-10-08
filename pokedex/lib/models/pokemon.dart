class Pokemon{
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final List<String> abilities;
  final Map<String, int> baseStats;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.abilities,
    required this.baseStats
  });

  factory Pokemon.fromJson(Map<String, dynamic> json){
    return Pokemon(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['front_default'],
      types: (json['types'] as List)
        .map((type)=> type['type']['name'].toString()).toList(),
      abilities: (json['abilities'] as List)
        .map((ability) => ability['ability']['name'].toString()).toList(),
      baseStats: {
        'hp': json['stats'][0]['base_stat'],
        'attack': json['stats'][1]['base_stat'],
        'defense': json['stats'][2]['base_stat'],
        'speed': json['stats'][3]['base_stat'],
      },
    );
  }
}