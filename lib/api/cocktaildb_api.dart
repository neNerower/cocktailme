
import 'package:cocktailme/api/api.dart';
import 'package:cocktailme/models/cocktail.dart';
import 'package:dio/dio.dart';

class CocktailDbApi extends CocktailApi {
  late final _dio = Dio(BaseOptions(
    baseUrl: "https://www.thecocktaildb.com/api/json/v1/1/",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  @override
  Future<Cocktail> getCocktailById(int id) async {
    final response = await _dio.get('lookup.php?i=$id');
    return Cocktail.fromJson(response.data["drinks"].first);
  }

  @override
  Future<Cocktail> getRandom() async {
    final response = await _dio.get("random.php");
    return Cocktail.fromJson(response.data["drinks"].first);
  }

  @override
  Future<List<Cocktail>> searchByName(String name) async {
    final response = await _dio.get("search.php?s=$name");
    return response.data["drinks"].map<Cocktail>((d) => Cocktail.fromJson(d)).toList();
  }
}
