import 'package:flutter/material.dart';
import '../hive/hive_interface.dart';
import '../models/cocktail_model.dart';

class HeartButton extends StatefulWidget {
  const HeartButton({Key? key, this.size, required this.cocktailModel})
      : super(key: key);
  final double? size;
  final CocktailModel cocktailModel;

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
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
