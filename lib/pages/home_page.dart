import 'package:flutter/material.dart';
import 'package:flutter_pokedex_ea/model/pokemon_model.dart';
import 'package:flutter_pokedex_ea/services/pokedex_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder<List<PokemonModel>>(
          future: _pokemonListFuture,
          // initialData: InitialData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<PokemonModel> _myList = snapshot.data!;
              return ListView.builder(
                itemCount: _myList.length,
                itemBuilder: (BuildContext context, int index) {
                  var currentPokeomon = _myList[index];

                  return ListTile(
                    title: Text(currentPokeomon.name.toString()),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Text("veri gelmedi");
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
