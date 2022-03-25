import 'package:cocktailme/models/cocktail_model.dart';
import 'package:cocktailme/stringbuilder/stringbuilder.dart';
import 'package:cocktailme/widgets/glassmorphic_widget.dart';
import 'package:cocktailme/widgets/heart_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CocktailInfo extends StatefulWidget {
  final CocktailModel cocktailModel;


  CocktailInfo({Key? key, required this.cocktailModel} ) : super(key: key);

  @override
  State<CocktailInfo> createState() => _CocktailInfoState();
}

class _CocktailInfoState extends State<CocktailInfo> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height/10,
        backgroundColor: Colors.black,
        shadowColor: Colors.transparent,
        title: Center(
            child: Text(widget.cocktailModel.name,
                style: Theme.of(context).textTheme.bodyMedium)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [HeartButton(cocktailModel: widget.cocktailModel)],
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
                    child: Image.network(widget.cocktailModel.image!),
                  ),
                  //Spacer
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 24,
                  ),
                  //Cocktail ingredients
                  GlassmorphicContainer(
                    child: Text(
                      "Ingredients:\n\n${buildStringFromList(widget.cocktailModel.ingredients)}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  //Spacer
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 24,
                  ),
                  //Cocktail description
                  GlassmorphicContainer(
                    child: Text(
                      "Description:\n\n${widget.cocktailModel.instructions}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
