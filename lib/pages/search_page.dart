import 'dart:ui';
import 'package:cocktailme/api/cocktaildb_api.dart';
import 'package:cocktailme/models/cocktail_model.dart';
import 'package:cocktailme/widgets/coctail_info.dart';
import 'package:cocktailme/widgets/coctail_preview.dart';
import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String inputText = "";
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Color.fromRGBO(128, 128, 128, 1),
                ),
                onPressed: () {setState(() {
                  inputText = _controller.value.text;
                });}),
            title: TextField(
                controller: _controller,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium),
            onChanged: (text){
                  searchDelay();
            },
            )),
        body: GestureDetector(
          onTap: (){
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
                            child: CocktailPreview(cocktailsByName[index]),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CocktailInfo((cocktailsByName[index])),
                                  ));
                            });
                      });
                }
                else if(snapshot.data == null && snapshot.connectionState == ConnectionState.done){
                  return Center(
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.4),
                                Colors.white.withOpacity(0.2),
                              ],
                              begin: AlignmentDirectional.topStart,
                              end: AlignmentDirectional.bottomEnd,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              width: 1.5,
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          child: ClipRRect(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Can't find cocktail :( \nTry Something other",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              )),
                        ),
                      ),
                    ),
                  );
                }
                else {
                 return const Center(child: CircularProgressIndicator());
                }
              }
          ),
        )
    );
  }

  void searchDelay(){
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        inputText = _controller.value.text;
      });

    });
  }

}
