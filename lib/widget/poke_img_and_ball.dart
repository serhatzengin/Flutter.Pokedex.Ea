import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_pokedex_ea/constants/ui_helper.dart';
import 'package:flutter_pokedex_ea/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImageAndBall({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pokeball.png';

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballImageUrl,
            width: UIHelper.calculatePokeImgBallSize(),
            height: UIHelper.calculatePokeImgBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: CachedNetworkImage(
            width: UIHelper.calculatePokeImgBallSize(),
            height: UIHelper.calculatePokeImgBallSize(),
            imageUrl: pokemon.img ?? '',
            errorWidget: (context, url, error) => const Icon(Icons.ac_unit),
            fit: BoxFit.fitHeight,
            placeholder: (context, url) => const CircularProgressIndicator(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
