import 'package:flutter/material.dart';
import 'package:flutter_pokedex_ea/constants/constants.dart';
import 'package:flutter_pokedex_ea/constants/ui_helper.dart';
import 'package:flutter_pokedex_ea/model/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeInformation({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.w)),
            color: Colors.white),
        child: Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildInformationRow('Name', pokemon.name),
              _buildInformationRow('Height', pokemon.height),
              _buildInformationRow('Weight', pokemon.weight),
              _buildInformationRow('Spawn Time', pokemon.spawnTime),
              _buildInformationRow('Weakness', pokemon.weaknesses),
              _buildInformationRow('Pre Evolution', pokemon.prevEvolution),
              _buildInformationRow('Next Evolution', pokemon.nextEvolution),
            ],
          ),
        ));
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Constans.getPokeInfoLabelTextStyle()),
        if (value is List && value.isNotEmpty)
          Text(value.join(' ,'), style: Constans.getPokeInfoTextStyle())
        else if (value == null)
          Text('Not available', style: Constans.getPokeInfoTextStyle())
        else
          Text(value.toString(), style: Constans.getPokeInfoTextStyle())
      ],
    );
  }
}
