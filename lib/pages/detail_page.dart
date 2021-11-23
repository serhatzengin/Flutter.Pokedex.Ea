import 'package:flutter/material.dart';
import 'package:flutter_pokedex_ea/constants/ui_helper.dart';
import 'package:flutter_pokedex_ea/model/pokemon_model.dart';
import 'package:flutter_pokedex_ea/widget/poke_type_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                iconSize: 24.w,
                //kısa kenara göre oranlamasını söyledik
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          SizedBox(height: 0.02.sh),
          PokeNameType(pokemon: pokemon)
        ],
      )),
    );
  }
}
