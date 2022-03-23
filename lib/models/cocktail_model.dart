
class CocktailModel {
  final int id;
  final String name;
  final String alcoholic;
  final String glassType;
  final String instructions;
  final String? image;
  List<String> ingredients = [];

  CocktailModel(this.id, this.name, this.alcoholic, this.glassType, this.instructions, this.image);

}
