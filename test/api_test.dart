import 'package:flutter_test/flutter_test.dart';
import 'package:cocktailme/api/cocktaildb_api.dart';

void main() {
  test("Get random cocktail", () async {
    final api = CocktailDbApi();
    var cocktail = await api.getRandom();

    expect(cocktail.idDrink, isNotEmpty);
  });

  test("Get cocktail by id", () async {
    final api = CocktailDbApi();
    const id = 11007;

    var cocktail = await api.getCocktailById(id);
    expect(cocktail.idDrink, id.toString());
  });

  test("Search by name", () async {
    final api = CocktailDbApi();
    const name = "Margarita";

    var cocktail = await api.searchByName(name);
    expect(
      cocktail.any((element) => element.strDrink?.contains(name) ?? false),
      true,
    );
  });
}
