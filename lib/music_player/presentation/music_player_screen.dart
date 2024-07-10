import 'package:api_demo_task/music_player/controller/music_player_controller.dart';
import 'package:api_demo_task/utils/app_colors.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicPlayerScreen extends StatelessWidget {
  final MusicPlayerController musicController = Get.put(MusicPlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: CommonText(
          text: 'Good evening',
          color: AppColors.whiteColor,
          fontSize: 23,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none,
                color: AppColors.whiteColor,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.watch_later_outlined,
                color: AppColors.whiteColor,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: AppColors.whiteColor,
              )),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Text('Top Picks', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          // ),
          Obx(() {
            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 5 / 2,
              ),
              itemCount: musicController.topPicks.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        musicController.topPicks[index].imageUrl,
                        fit: BoxFit.cover,
                        height: 120,
                        width: 80,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CommonText(
                            maxLine: 2,
                            text: musicController.topPicks[index].title,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ).paddingOnly(top: 12,left: 5),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }),
          CommonText(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.whiteColor, text: 'Jump back in',)
              .paddingOnly(top: 30, bottom: 12),
          Obx(() {
            return Container(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: musicController.jumpBackIn.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            musicController.jumpBackIn[index].imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                CommonText(
                                  fontSize: 14,
                                  text: musicController.jumpBackIn[index].title,
                                  color: AppColors.whiteColor,
                                ),
                              ],
                            ).paddingSymmetric(vertical: 7),
                            Row(
                              children: [
                                CommonText(
                                  text:'PlayList',
                                  color: AppColors.greyColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 10,
                  );
                },
              ),
            );
          }),
          CommonText(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.whiteColor, text: 'Recently Played',)
              .paddingOnly(top: 40, bottom: 12),
          Obx(() {
            return Container(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: musicController.RecentlyPlay.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            musicController.RecentlyPlay[index].imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                CommonText(
                                  fontSize: 14,
                                  text: musicController.RecentlyPlay[index].title,
                                  color: AppColors.whiteColor,
                                ),
                              ],
                            ).paddingSymmetric(vertical: 7),
                            Row(
                              children: [
                                CommonText(
                                  text:'PlayList',
                                  color: AppColors.greyColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 10,
                  );
                },
              ),
            );
          }),
        ],
      ).paddingAll(16)),
    );
  }
}
