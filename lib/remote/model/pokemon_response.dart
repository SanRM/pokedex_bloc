// Asumiendo que tienes una clase Results y PokemonResponse definidas en algún lugar
class Results {
  final String name;
  final String url;

  Results({required this.name, required this.url});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      name: json['name'],
      url: json['url'],
    );
  }
}

class PokemonResponse {
  final List<Results> results;

  PokemonResponse({required this.results});

  factory PokemonResponse.fromJson(Map<String, dynamic> json) {
    return PokemonResponse(
      results: (json['results'] as List)
          .map((i) => Results.fromJson(i))
          .toList(),
    );
  }
}