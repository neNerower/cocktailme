import 'dart:ui';
import 'package:cocktailme/api/cocktaildb_api.dart';
import 'package:cocktailme/models/cocktail_model.dart';
import 'package:cocktailme/widgets/coctail_info.dart';
import 'package:cocktailme/widgets/coctail_preview.dart';
import 'package:cocktailme/widgets/glassmorphic_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String inputText = "";
  final TextEditingController _controller = TextEditingController();
  late Box box;

  @override
  void initState() {
    super.initState();
  }

  void callback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Colors.black,
            toolbarHeight: MediaQuery.of(context).size.height/10,
            leading: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Color.fromRGBO(128, 128, 128, 1),
                ),
                onPressed: () {
                  setState(() {
                    inputText = _controller.value.text;
                  });
                }),
            title: TextField(
              controller: _controller,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: Theme.of(context).textTheme.bodyMedium),
              onChanged: (text) {
                searchDelay();
              },
            )),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: FutureBuilder(
              future: CocktailDbApi().searchByName(inputText),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  List<CocktailModel> cocktailsByName = snapshot.data;
                  return ListView.builder(
                      itemCount: cocktailsByName.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            child: CocktailPreview(cocktailModel: cocktailsByName[index]),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CocktailInfo(cocktailModel: cocktailsByName[index]),
                                  ));
                            });
                      });
                } else if (snapshot.data == null &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Center(
                      child: GlassmorphicContainer(
                    child: Text(
                      "Can't find cocktail :( \nTry Something other",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }

  void searchDelay() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        inputText = _controller.value.text;
      });
    });
  }
}
