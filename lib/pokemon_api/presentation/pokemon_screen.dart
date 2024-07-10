import 'package:api_demo_task/pokemon_api/controller/pokemon_controller.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonScreen extends StatelessWidget {
  PokemonScreen({super.key});

  final PokemonController pokemonController = Get.put(PokemonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          itemCount: pokemonController.pokemonList.value.pokemon?.length,
          itemBuilder: (context, index) {
            var data = pokemonController.pokemonList.value.pokemon?[index];
            return Card(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1), border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
                          child: Image.network(
                            data?.img ?? '',
                            fit: BoxFit.cover,
                          ).paddingAll(10)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: "id : ${data?.id.toString() ?? ''}",
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          CommonText(
                            text: " ${data?.candy ?? ''}",
                            color: Colors.black,
                            fontSize: 16,
                          ).paddingSymmetric(vertical: 10),
                          CommonText(
                            text: "height : ${data?.height ?? ''}",
                            color: Colors.black,
                            fontSize: 19,
                          ).paddingOnly(bottom: 8),
                          CommonText(
                            text: "weight : ${data?.weight ?? ''}",
                            color: Colors.black,
                            fontSize: 19,
                          ),
                          Row(
                            children: [
                              CommonText(
                                text: "egg : ${data?.egg ?? ''}",
                                color: Colors.black,
                                fontSize: 19,
                              ).paddingSymmetric(horizontal: 8),
                            ],
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 12, vertical: 12)
                    ],
                  ),

                  Row(
                    children: [
                      CommonText(
                        text: "name : ${data?.name ?? ''}",
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ],
                  ).paddingOnly(bottom: 8),
                  Row(
                    children: [
                      CommonText(
                        text: "Type :",
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: pokemonController.pokemonList.value.pokemon?[index].type?.length,
                    itemBuilder: (context, index) {
                      var data = pokemonController.pokemonList.value.pokemon?[index].type?[index];
                      return CommonText(
                        text: "${data ?? ''}",
                        color: Colors.black,
                        fontSize: 18,
                      );
                    },
                  ).paddingOnly(bottom: 10),
                  Row(
                    children: [
                      CommonText(
                        text: "weaknesses :",
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemCount: pokemonController.pokemonList.value.pokemon?[index].weaknesses?.length,
                  //   itemBuilder: (context, index) {
                  //     var datas = pokemonController.pokemonList.value.pokemon?[index].weaknesses?[index];
                  //     return CommonText(
                  //       text: "${datas ?? ''}",
                  //       color: Colors.black,
                  //       fontSize: 18,
                  //     );
                  //   },
                  // ),
                ],
              ).paddingSymmetric(vertical: 10, horizontal: 10),
            ).paddingSymmetric(vertical: 5, horizontal: 5);
          },
        ),
      ),
    );
  }
}
