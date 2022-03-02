import '../models/cocktail.dart';

abstract class CocktailApi {
  Future<List<Cocktail>> searchByName(String name);
  Future<Cocktail> getCocktailById(int id);
  Future<Cocktail> getRandom();
}
