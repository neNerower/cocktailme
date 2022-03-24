import 'package:cocktailme/hive/hive_interface.dart';
import 'package:flutter/material.dart';
import '../models/cocktail_model.dart';
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height/10,
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                "Favourites", style: Theme.of(context).textTheme.bodyMedium,
              ),
            )),
        body: ListView.builder(
            itemCount: favourites.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  child: CocktailPreview(cocktailModel: favourites[index], icon: IconButton(
                    onPressed: () {
                      IHive().delete(favourites[index]);
                      setState(() {favourites = IHive().getAll()!.toList();});
                    },
                    icon: const Icon(Icons.clear),
                    iconSize: MediaQuery.of(context).size.height/20,
                    color: Colors.white,
                  ),),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CocktailInfo(cocktailModel: favourites[index],),
                        ));
                  });
            }));
  }
}
