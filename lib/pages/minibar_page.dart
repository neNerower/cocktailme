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
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
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
            ? AnimatedList(
                key: _listKey,
                physics: BouncingScrollPhysics(),
                initialItemCount: favourites.length,
                itemBuilder: (context, index, animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    child: GestureDetector(
                        child: CocktailPreview(
                          cocktailModel: favourites[index],
                          button: IconButton(
                            onPressed: () {
                              deleteCocktail(index);
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
                                          cocktailModel: favourites[index]))))
                              .then((value) {
                            setState(() {
                              favourites = IHive().getAll()!.toList();
                            });
                          });
                        }),
                  );
                })
            : Center(
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: GlassmorphicContainer(
                    child: Center(
                  child: Text(
                    "Your favourite cocktails will be here",
                    textAlign: TextAlign.center,
                  ),
                )),
              )));
  }

  void deleteCocktail(index) {
    IHive().delete(favourites[index]);
    var removedItem = favourites.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => SlideTransition(
        position: CurvedAnimation(
          curve: Curves.easeInOut,
          parent: animation,
        ).drive((Tween<Offset>(
          begin: const Offset(-1, 0),
          end: const Offset(0, 0),
        ))),
        child: CocktailPreview(
          cocktailModel: removedItem,
          button: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.clear),
            iconSize: MediaQuery.of(context).size.height / 20,
            color: Colors.white,
          ),
        ),
      ),
      duration: Duration(milliseconds: 500)
    );
    setState(() {
      favourites = IHive().getAll()!.toList();
    });
  }
}
