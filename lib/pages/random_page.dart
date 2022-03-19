import 'dart:math';
import 'dart:ui';

import 'package:cocktailme/widgets/coctail_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/cocktail_model.dart';

class RandomPage extends StatefulWidget {
  List<CocktailModel> cocktailModels;

  RandomPage(this.cocktailModels, {Key? key}) : super(key: key);

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  //String for better ingredients look
  String ingredients = "";
  late int random;

  @override
  void initState() {
    //generate random number
    random = Random().nextInt(widget.cocktailModels.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Make ingredients string when activity started
    for (String i in widget.cocktailModels[random].ingredients) {
      if (i == widget.cocktailModels[random].ingredients.last) {
        ingredients += i += ".";
      } else {
        ingredients += i += ", ";
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.transparent,
        title: Center(
            child: Text(widget.cocktailModels[random].name,
                style: Theme.of(context).textTheme.bodyMedium)),
        leading: IconButton(
          onPressed: () {
            setState(() {
              random = Random().nextInt(widget.cocktailModels.length);
              ingredients = "";
            });
          },
          icon: Icon(Icons.refresh),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.star_border_rounded),
          ),
        ],
      ),
      body: Stack(children: [
        SvgPicture.asset(
          "lib/assets/images/HomeScreen.svg",
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Cocktail Image
                  ClipRRect(
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Image.network(
                                widget.cocktailModels[random].image!),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Spacer
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 24,
                  ),
                  //Cocktail ingredients
                  ClipRRect(
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
                            "Ingredients:\n\n$ingredients",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        )),
                      ),
                    ),
                  ),
                  //Spacer
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 24,
                  ),
                  //Cocktail description
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CocktailInfo(widget.cocktailModels[random])),
                      );
                    },
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
                            child: Center(
                                child: Text(
                              "ABOUT",
                              style: Theme.of(context).textTheme.bodyMedium,
                            )),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
