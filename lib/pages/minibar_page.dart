import 'package:flutter/material.dart';

class MinibarPage extends StatefulWidget {
  const MinibarPage({Key? key}) : super(key: key);

  @override
  State<MinibarPage> createState() => _MinibarPageState();
}

class _MinibarPageState extends State<MinibarPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Minibar Page"),
    );
  }
}
