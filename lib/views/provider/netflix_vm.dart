import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class NetflixVM extends ChangeNotifier {
  final controller = PageController(viewportFraction: 0.4);
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  set selectedIndex(int val) {
    _selectedIndex = val;
    notifyListeners();
  }

  final assetsAudioPlayer = AssetsAudioPlayer();
  final assetsAudioPlayer2 = AssetsAudioPlayer();

  init() {
    assetsAudioPlayer2.open(Audio("assets/sounds/2.mp3"));
    assetsAudioPlayer.open(
      Playlist(audios: [
        Audio("assets/sounds/1.wav"),
        Audio("assets/sounds/1.wav"),
      ]),
      loopMode: LoopMode.playlist, //loop the full playlist
    );

    assetsAudioPlayer.setLoopMode(LoopMode.playlist);

    assetsAudioPlayer.setVolume(0.3);
    assetsAudioPlayer2.setVolume(0.2);
    assetsAudioPlayer.play();
  }
}
