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
  late Icon icon;
  @override
  Widget build(BuildContext context) {
    if (IHive().isContains(widget.cocktailModel)) {
      icon = const Icon(Icons.favorite_outlined);
      return IconButton(
        onPressed: () {
          IHive().delete(widget.cocktailModel);
          setState(() {});
        },
        icon: icon,
        iconSize: widget.size ?? 24.0,
        color: Color.fromRGBO(236, 117, 255, 1),
      );
    } else {
      icon = const Icon(Icons.favorite_border);
      return IconButton(
        onPressed: () {
          IHive().save(widget.cocktailModel);
          setState(() {});
        },
        icon: icon,
        iconSize: widget.size ?? 24.0,
        color: Color.fromRGBO(236, 117, 255, 1),
      );
    }
  }
}
