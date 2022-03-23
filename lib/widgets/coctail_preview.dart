import 'dart:ui';

import 'package:cocktailme/models/cocktail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CocktailPreview extends StatelessWidget{
  CocktailModel cocktailModel;
  CocktailPreview(this.cocktailModel, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            height: MediaQuery.of(context).size.height/8,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.4),
                  Colors.white.withOpacity(0.2),
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Container(child: Image.network(cocktailModel.image!)),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                    child: Text(cocktailModel.name, style: Theme.of(context).textTheme.bodyMedium)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.star_border_rounded), iconSize: MediaQuery.of(context).size.height/18, color: Colors.white,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}