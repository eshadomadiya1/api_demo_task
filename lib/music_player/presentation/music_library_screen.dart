import 'package:api_demo_task/music_player/controller/music_player_controller.dart';
import 'package:api_demo_task/utils/app_colors.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:just_audio/just_audio.dart';

class MusicLibraryScreen extends StatefulWidget {
  const MusicLibraryScreen({super.key});

  @override
  State<MusicLibraryScreen> createState() => _MusicLibraryScreenState();
}



class _MusicLibraryScreenState extends State<MusicLibraryScreen> {
  final MusicPlayerController musicController = Get.put(MusicPlayerController());

  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  int? currentPlayingIndex;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }


  void stopSong() {
    audioPlayer.play();
    setState(() {
      isPlaying = false;
    });
  }
  void playSong(int index) async {
    await audioPlayer.setAudioSource(
      AudioSource.asset(musicController.audios[index]),
    );
    audioPlayer.play();
    setState(() {
      isPlaying = true;
      currentPlayingIndex = index;
    });
  }

  void skipToNext() {
    int nextIndex = (currentPlayingIndex! + 1) % musicController.audios.length;
    playSong(nextIndex);
  }

  void skipToPrevious() {
    int prevIndex = (currentPlayingIndex! - 1 + musicController.audios.length) % musicController.audios.length;
    playSong(prevIndex);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,

        title:  CommonText( text: 'Music Player',color: AppColors.whiteColor,fontSize: 23,),
      ),
      body: Swiper(
        itemBuilder: (context, index) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration:  BoxDecoration(
                border: Border.all(color: Colors.white)
              ),
              child: Column(
                children: [
                  Image.asset(
                    musicController.songCoverPage[index],
                    width: double.infinity,
                    height: 320,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    musicController.songList[index],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white),
                  ),
                  const Text('Artist Name',style: TextStyle(color: Colors.white),),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3)
                            ),
                            child: const Icon(Icons.skip_previous,color: Colors.white)),
                          onPressed: currentPlayingIndex == null ? null : skipToPrevious,
                      ),
                      IconButton(
                        icon: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Icon(
                              isPlaying && currentPlayingIndex == index ? Icons.pause : Icons.play_arrow,
                              color: Colors.white
                          ),
                        ),
                        onPressed: () async {
                          if (isPlaying && currentPlayingIndex == index) {
                            audioPlayer.pause();
                            setState(() {
                              isPlaying = false;
                            });
                          } else {
                            await audioPlayer.setAudioSource(
                              AudioSource.asset(musicController.audios[index]),
                            );
                            audioPlayer.play();
                            setState(() {
                              isPlaying = true;
                              currentPlayingIndex = index;
                            });
                          }
                        },
                      ),
                      IconButton(
                        icon: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(3)
                            ),
                            child: const Icon(Icons.skip_next,color: Colors.white)),
                        onPressed: currentPlayingIndex == null ? null : skipToNext,
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ).marginOnly(right: 8, left: 8),
        itemCount: musicController.audios.length,
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
}



