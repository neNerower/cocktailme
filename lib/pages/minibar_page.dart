import 'package:cocktailme/hive/hive_interface.dart';
import 'package:cocktailme/widgets/glassmorphic_widget.dart';
import 'package:flutter/material.dart';
import '../models/cocktail_model.dart';
import '../transitions/slidetoproute.dart';
import '../widgets/coctail_info.dart';
import '../widgets/coctail_preview.dart';

class MinibarPage extends StatefulWidget {
  const MinibarPage({Key? key}) : super(key: key);

  @override
  State<MinibarPage> createState() => _MinibarPageState();
}

class _MinibarPageState extends State<MinibarPage> {
  List<CocktailModel> favourites = IHive().getAll()!.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height / 10,
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                "Favourites",
              ),
            )),
        body: favourites.isNotEmpty
            ? ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: favourites.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: CocktailPreview(
                        cocktailModel: favourites[index],
                        icon: IconButton(
                          onPressed: () {
                            IHive().delete(favourites[index]);
                            setState(() {
                              favourites = IHive().getAll()!.toList();
                            });
                          },
                          icon: const Icon(Icons.clear),
                          iconSize: MediaQuery.of(context).size.height / 20,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            SlideTopRoute(
                                page: (CocktailInfo(
                                    cocktailModel: favourites[index]))));
                      });
                })
            : Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: GlassmorphicContainer(
                      child: Center(
                  child: Text("Your favourite cocktails will be here", textAlign: TextAlign.center,),
              )),
                )));
  }
}
