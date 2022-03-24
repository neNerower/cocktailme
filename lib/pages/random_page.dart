import 'package:cocktailme/api/cocktaildb_api.dart';
import 'package:cocktailme/hive/hive_interface.dart';
import 'package:cocktailme/stringbuilder/stringbuilder.dart';
import 'package:cocktailme/widgets/coctail_info.dart';
import 'package:cocktailme/widgets/glassmorphic_widget.dart';
import 'package:cocktailme/widgets/star_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/cocktail_model.dart';

class RandomPage extends StatefulWidget {
  RandomPage({Key? key}) : super(key: key);

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CocktailDbApi().getRandom(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          CocktailModel randomCocktail = snapshot.data;
          return Scaffold(
            extendBody: true,
            backgroundColor: Colors.black,
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height/10,
              backgroundColor: Colors.black,
              shadowColor: Colors.transparent,
              title: Center(
                  child: Text(randomCocktail.name,
                      style: Theme.of(context).textTheme.bodyMedium)),
              leading: IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(Icons.refresh),
              ),
              actions: [
                StarButton(cocktailModel: randomCocktail)
              ],
            ),
            body: Stack(children: [
              SvgPicture.asset(
                "lib/assets/images/HomeScreen.svg",
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //Cocktail Image
                        GlassmorphicContainer(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Image.network(randomCocktail.image!),
                          ),
                        ),
                        //Spacer
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 24,
                        ),
                        //Cocktail ingredients
                        GlassmorphicContainer(
                          child: Text(
                            "Ingredients:\n\n${buildStringFromList(randomCocktail.ingredients)}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        //Spacer
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 24,
                        ),
                        //Cocktail description
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CocktailInfo(cocktailModel: randomCocktail)),
                              );
                            },
                            child: GlassmorphicContainer(
                              child: Center(
                                  child: Text(
                                "ABOUT",
                                style: Theme.of(context).textTheme.bodyMedium,
                              )),
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
