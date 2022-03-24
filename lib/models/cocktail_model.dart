import 'package:hive/hive.dart';
part 'cocktail_model.g.dart';

@HiveType(typeId: 0)
class CocktailModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String alcoholic;
  @HiveField(3)
  final String glassType;
  @HiveField(4)
  final String instructions;
  @HiveField(5)
  final String? image;
  @HiveField(6)
  List<String> ingredients = [];

  CocktailModel(this.id, this.name, this.alcoholic, this.glassType, this.instructions, this.image);

}
