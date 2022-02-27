import 'package:flutter/material.dart';

class RandomPage extends StatefulWidget {
  RandomPage({Key? key}) : super(key: key);

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Random Page"),
      ),
    );
  }
}