import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex_ea/constants/ui_helper.dart';
import 'package:flutter_pokedex_ea/model/pokemon_model.dart';
import 'package:flutter_pokedex_ea/widget/poke_information.dart';
import 'package:flutter_pokedex_ea/widget/poke_type_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pokeball.png';

    return ScreenUtil().orientation == Orientation.portrait
        ? _builtPortraitBody(context, pokeballImageUrl)
        : builtLandScapeBody(context, pokeballImageUrl);
  }

  Scaffold builtLandScapeBody(BuildContext context, String pokeballImageUrl) {
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
                  iconSize: 18.w,
                  //kısa kenara göre oranlamasını söyledik
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      PokeNameType(pokemon: pokemon),
                      Expanded(
                        child: Hero(
                          tag: pokemon.id!,
                          child: CachedNetworkImage(
                              imageUrl: pokemon.img ?? '',
                              height: 0.25.sw,
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: UIHelper.getDefaultPadding(),
                      child: PokeInformation(pokemon: pokemon),
                    )),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Scaffold _builtPortraitBody(BuildContext context, String pokeballImageUrl) {
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
                iconSize: 18.w,
                //kısa kenara göre oranlamasını söyledik
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          SizedBox(height: 0.02.sh),
          PokeNameType(pokemon: pokemon),
          SizedBox(height: 0.02.sh),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  pokeballImageUrl,
                  fit: BoxFit.fitHeight,
                ),
                right: 0,
                top: 0,
                height: 0.15.sh,
              ),
              Positioned(
                top: 0.12.sh,
                left: 0,
                bottom: 0,
                right: 0,
                child: PokeInformation(pokemon: pokemon),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: pokemon.id!,
                  child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      height: 0.25.sh,
                      fit: BoxFit.fitHeight),
                ),
              )
            ],
          ))
        ],
      )),
    );
  }
}
