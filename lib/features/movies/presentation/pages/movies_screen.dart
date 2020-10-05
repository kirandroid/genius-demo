import 'package:flutter/material.dart';
import 'package:genius_demo/core/widgets/custom_scaffold.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "MOVIES",
      body: Column(
        children: [],
      ),
    );
  }
}
