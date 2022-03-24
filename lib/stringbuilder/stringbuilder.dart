String buildStringFromList(List<String> list){
  String ingredients = "";
  for (String i in list) {
    if (i == list.last) {
      ingredients += i += ".";
    } else {
      ingredients += i += ", ";
    }
  }
  return ingredients;
}