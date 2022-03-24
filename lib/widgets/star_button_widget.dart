import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../hive/hive_interface.dart';
import '../models/cocktail_model.dart';

class StarButton extends StatefulWidget {
  const StarButton({Key? key, this.size, required this.cocktailModel})
      : super(key: key);
  final double? size;
  final CocktailModel cocktailModel;

  @override
  State<StarButton> createState() => _StarButtonState();
}

class _StarButtonState extends State<StarButton> {
  late Icon star;
  @override
  Widget build(BuildContext context) {
    if (IHive().isContains(widget.cocktailModel)) {
      star = const Icon(Icons.star_rounded);
      return IconButton(
        onPressed: () {
          IHive().delete(widget.cocktailModel);
          setState(() {});
        },
        icon: star,
        iconSize: widget.size ?? 24.0,
        color: Colors.white,
      );
    } else {
      star = const Icon(Icons.star_border_rounded);
      return IconButton(
        onPressed: () {
          IHive().save(widget.cocktailModel);
          setState(() {});
        },
        icon: star,
        iconSize: widget.size ?? 24.0,
        color: Colors.white,
      );
    }
  }
}
