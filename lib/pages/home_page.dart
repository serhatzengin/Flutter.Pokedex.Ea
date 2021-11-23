import 'package:flutter/material.dart';
import 'package:flutter_pokedex_ea/widget/app_title.dart';
import 'package:flutter_pokedex_ea/widget/pokemon_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Column(
            children: [
              AppTitle(),
              PokemonList(),
            ],
          );
        },
      ),
    );
  }
}
