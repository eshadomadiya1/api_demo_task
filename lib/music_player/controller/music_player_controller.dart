import 'package:get/get.dart';



class MusicPlayerController extends GetxController {
  var topPicks = <MusicItem>[].obs;
  var jumpBackIn = <MusicItem>[].obs;
  var RecentlyPlay = <MusicItem>[].obs;

  @override
  void onInit() {
    fetchTopPicks();
    fetchJumpBackIn();
    recentlyPlay();
    super.onInit();
  }

  List songList = [
    '2010 mashup',
    'Filhaal 2 song',
    'saami saami - The Pushpa song',
    'SAD song',

  ];

  List audios = [
    "assets/audio/Tujhme Khoya Rahu.mp3",
    'assets/audio/Filhaal.mp3',
    "assets/audio/sami1.mp3",
    "assets/audio/sad.mp3",
  ];

  List songCoverPage = [
    'assets/audio/images/mixup.jpg',
    'assets/music_images/filhall.webp',
    "assets/audio/images/sami2.jpg",
    "assets/music_images/ranbir.jpg",
  ];

  void fetchTopPicks() {
    var items = [
      MusicItem(title: '2010 mix', imageUrl: 'assets/music_images/filhall.webp'),
      MusicItem(title: 'Hindi Songs', imageUrl: 'assets/music_images/size_m (1).jpg'),
      MusicItem(title: 'Top of  Songs', imageUrl: 'assets/music_images/music.jpg'),
      MusicItem(title: '!R', imageUrl: 'assets/music_images/Lover.jpg'),
      MusicItem(title: 'Hindi Lofi', imageUrl: 'assets/music_images/modern-spotify-album-cover-template.jpg'),
      MusicItem(title: 'Temp', imageUrl: 'assets/music_images/mucie_bravo.jpg'),
    ];
    topPicks.assignAll(items);
  }

  void fetchJumpBackIn() {
    var items = [
      MusicItem(title: '2010 mix', imageUrl: 'assets/music_images/love_aj_kal.jpg'),
      MusicItem(title: 'Hindi Songs', imageUrl: 'assets/music_images/sad.jpg'),
      MusicItem(title: 'Top of the world Songs', imageUrl: 'assets/music_images/size_m.jpg'),
    ];
    jumpBackIn.assignAll(items);
  }

  void recentlyPlay() {
    var items = [
      MusicItem(title: '2010 mix', imageUrl: 'assets/music_images/kyu.png'),
      MusicItem(title: 'Hindi Songs', imageUrl: 'assets/music_images/Kisi-Ka-Bhai-Kisi-Ki-Jaan-Hindi-2023-20230427184704-500x500.jpg'),
      MusicItem(title: 'Top of the world Songs', imageUrl: 'assets/music_images/ranbir.jpg'),
    ];
    RecentlyPlay.assignAll(items);
  }
}

class MusicItem {
  final String title;
  final String imageUrl;

  MusicItem({required this.title, required this.imageUrl});
}
