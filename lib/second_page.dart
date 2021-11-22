import 'package:flutter/material.dart';
import 'package:flutter_pokedex_ea/services/pokedex_api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // PokeApi.getPokemonData;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  setState(() {
                    PokeApi.getPokemonData();
                  });
                },
                child: const Text("Write"))
          ],
        ),
      ),
    );
  }
}
