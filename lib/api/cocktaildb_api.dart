import 'package:cocktailme/models/cocktail.dart';
import 'package:dio/dio.dart';

import '../models/cocktailmodel.dart';

class CocktailDbApi {
  static final CocktailDbApi _singleton = CocktailDbApi._internal();

  factory CocktailDbApi() {
    return _singleton;
  }

  CocktailDbApi._internal();

  late final _dio = Dio(BaseOptions(
    baseUrl: "https://www.thecocktaildb.com/api/json/v1/1/",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  Future<CocktailModel> getCocktailById(int id) async {
    final response = await _dio.get('lookup.php?i=$id');
    return toCocktailModel(Cocktail.fromJson(response.data["drinks"].first));
  }

  Future<CocktailModel> getRandom() async {
    final response = await _dio.get("random.php");
    return toCocktailModel(Cocktail.fromJson(response.data["drinks"].first));
  }

  Future<List<CocktailModel>> searchByName(String name) async {
    final response = await _dio.get("search.php?s=$name");
    return response.data["drinks"]
        .map<Cocktail>((d) => Cocktail.fromJson(d))
        .map<CocktailModel>(toCocktailModel)
        .toList();
  }

  CocktailModel toCocktailModel(Cocktail cocktail) {
    var cocktailModel = CocktailModel(int.parse(cocktail.idDrink!), 
      cocktail.strDrink!, cocktail.strAlcoholic!, 
      cocktail.strGlass!, cocktail.strInstructions!, cocktail.strDrinkThumb ?? cocktail.strImageSource);

    cocktailModel.ingredients = [];

    if (cocktail.strIngredient1 == null) {
      return cocktailModel;
    }
    cocktailModel.ingredients.add(cocktail.strIngredient1!);

    if (cocktail.strIngredient2 == null) {
      return cocktailModel;
    }
    cocktailModel.ingredients.add(cocktail.strIngredient2!);

    if (cocktail.strIngredient3 == null) {
      return cocktailModel;
    }
    cocktailModel.ingredients.add(cocktail.strIngredient3!);

    if (cocktail.strIngredient4 == null) {
      return cocktailModel;
    }
    cocktailModel.ingredients.add(cocktail.strIngredient4!);

    if (cocktail.strIngredient5 == null) {
      return cocktailModel;
    }
    cocktailModel.ingredients.add(cocktail.strIngredient5!);

    if (cocktail.strIngredient6 == null) {
      return cocktailModel;
    }
    cocktailModel.ingredients.add(cocktail.strIngredient6!);

    if (cocktail.strIngredient7 == null) {
      return cocktailModel;
    }
    cocktailModel.ingredients.add(cocktail.strIngredient7!);

    if (cocktail.strIngredient8 == null) {
      return cocktailModel;
    }
    cocktailModel.ingredients.add(cocktail.strIngredient8!);

    if (cocktail.strIngredient9 == null) {
      return cocktailModel;
    }
    cocktailModel.ingredients.add(cocktail.strIngredient9!);

    if (cocktail.strIngredient10 == null) {
      return cocktailModel;
    }
    cocktailModel.ingredients.add(cocktail.strIngredient10!);

    if (cocktail.strIngredient11 == null) {
      return cocktailModel;
    }
    cocktailModel.ingredients.add(cocktail.strIngredient11!);

    if (cocktail.strIngredient12 == null) {
      return cocktailModel;
    }
    cocktailModel.ingredients.add(cocktail.strIngredient12!);

    if (cocktail.strIngredient13 == null) {
      return cocktailModel;
    }
    cocktailModel.ingredients.add(cocktail.strIngredient13!);

    if (cocktail.strIngredient14 == null) {
      return cocktailModel;
    }
    cocktailModel.ingredients.add(cocktail.strIngredient14!);

    if (cocktail.strIngredient15 == null) {
      return cocktailModel;
    }
    cocktailModel.ingredients.add(cocktail.strIngredient15!);

    return cocktailModel;
  }
}
