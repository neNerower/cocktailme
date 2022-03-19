import 'package:cocktailme/models/cocktail_model.dart';
import 'package:cocktailme/widgets/coctail_info.dart';
import 'package:cocktailme/widgets/coctail_preview.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage(this.cocktailModels, {Key? key}) : super(key: key);
  List<CocktailModel> cocktailModels;
  @override
  State<SearchPage> createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchPage> {
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
          ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: CocktailPreview(widget.cocktailModels[index]),
              onTap: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CocktailInfo((widget.cocktailModels[index])),
              ));},
            );},
          ),
        ],
      ),
    );
  }
}
