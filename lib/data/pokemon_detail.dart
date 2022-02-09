class PokemonDetail {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int height;
  final int weight;
  final String description;

  PokemonDetail(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.types,
      required this.weight,
      required this.height,
      required this.description});
}
