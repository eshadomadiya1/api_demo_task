
import 'package:api_demo_task/pokemon_api/model/pokemon_model.dart';
import 'package:api_demo_task/pokemon_api/service/pokemon_Service.dart';
import 'package:get/get.dart';

class PokemonController extends GetxController {
  Rx<PokemonModel> pokemonList = PokemonModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    pokemonApi();
    super.onInit();
  }

  Future pokemonApi() async {
    try {
      pokemonList.value = await PokemonService.pokemonData();
    } catch (e, st) {
      print("pokemonApi e :: $e --\n $st");
    }
  }
}
