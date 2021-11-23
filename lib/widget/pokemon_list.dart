import 'package:flutter/material.dart';
import 'package:flutter_pokedex_ea/constants/constants.dart';
import 'package:flutter_pokedex_ea/model/pokemon_model.dart';
import 'package:flutter_pokedex_ea/services/pokedex_api.dart';
import 'package:flutter_pokedex_ea/widget/pokelist_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<PokemonModel>>(
        future: _pokemonListFuture,
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<PokemonModel> _myList = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 2 : 3,
              ),
              itemCount: _myList.length,
              itemBuilder: (BuildContext context, int index) {
                return PokeListItem(pokemon: _myList[index]);
              },
            );

            //  ListView.builder(
            //   itemCount: _myList.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     var currentPokeomon = _myList[index];

            //     return PokeListItem(pokemon: currentPokeomon);
            //   },
            // );

          } else if (snapshot.hasError) {
            return const Text("veri gelmedi");
          } else {
            return Center(
              child: Text("Data is Loading...",
                  style: Constans.getPokemonNameTextStyle()),
            );
          }
        },
      ),
    );
  }
}
