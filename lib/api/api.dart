import 'package:cocktailme/models/cocktailmodel.dart';

abstract class CocktailApi {
  Future<List<CocktailModel>> searchByName(String name);
  Future<CocktailModel> getCocktailById(int id);
  Future<CocktailModel> getRandom();
}
