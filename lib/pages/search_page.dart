import 'package:cocktailme/models/cocktail_model.dart';
import 'package:cocktailme/widgets/coctail_preview.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchPage> {
  CocktailModel test = CocktailModel(1, "Cuba", "Yes", "Shot", "Instructions", "https://picsum.photos/400");
  late List<CocktailPreview> prev = [CocktailPreview(test)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(icon: const Icon(Icons.search, color: Color.fromRGBO(128, 128, 128, 1),), onPressed: (){}),
        title: TextField(style: Theme.of(context).textTheme.bodyMedium, decoration: InputDecoration(hintText: "Search", hintStyle: Theme.of(context).textTheme.bodyMedium))
      ),
      body: Stack(
        children: [
          ListView.builder(itemBuilder: (BuildContext context, int index) { return prev[0];},
          ),
        ],
      ),
    );
  }
}
