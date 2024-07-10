import 'dart:convert';

import 'package:api_demo_task/api/api.dart';
import 'package:api_demo_task/pokemon_api/model/pokemon_model.dart';
import 'package:api_demo_task/utils/api_constants.dart';

class PokemonService{

  static Future<PokemonModel> pokemonData() async{
    var response =  await Api().get(
      ApiConstants.pokemonApi,
    );
    print("response.statusCode -- ${response.statusCode} -- response.body -- ${response.body}");
    return PokemonModel.fromJson(jsonDecode(response.body));
  }


}