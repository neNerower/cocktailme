import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/cocktail_model.dart';

class IHive {
  static final IHive _singleton = IHive._internal();

  factory IHive() {
    return _singleton;
  }

  IHive._internal();
  
  void save(CocktailModel cocktailModel){
    try{
      Hive.box('cocktailsBox').put(cocktailModel.id.toString(), cocktailModel);
      log("added");
      log(Hive.box('cocktailsBox').toMap().toString());
    }
    catch(e){
      log(e.toString());
    }
  }

  void delete(CocktailModel cocktailModel){
    try{
      Hive.box('cocktailsBox').delete(cocktailModel.id.toString());
      log("deleted");
      log(Hive.box('cocktailsBox').toMap().toString());
    }
    catch(e){
      log(e.toString());
    }
  }

  Iterable<CocktailModel>? getAll(){
    try{
      return Hive.box('cocktailsBox').values.cast();
    }
    catch(e){
      log(e.toString());
    }
    return null;
  }

  bool isContains(CocktailModel cocktailModel)=>
    Hive.box('cocktailsBox').containsKey(cocktailModel.id.toString());

}