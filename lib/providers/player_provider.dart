import 'package:flutter/foundation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerProvider extends ChangeNotifier {
  List<Track> results = [];
  int currentIndex = 0;
  PlayerState state = PlayerState.idle;
  bool autoplay = false;
  bool isSearching = false;
  String error = '';
  YoutubePlayerController? controller;

  void search(String query) {
    // Implementation for search
  }

  void playTrack(int index) {
    currentIndex = index;
    controller = YoutubePlayerController(
      initialVideoId: results[currentIndex].videoId,
      flags: YoutubePlayerFlags(hideControls: true, hideThumbnail: true),
    );
    // Additional play logic
  }

  void _controllerListener() {
    controller?.addListener(() {
      if (controller!.value.isEnded && autoplay) {
        playNext();
      }
    });
  }

  void togglePlayPause() {
    // Implementation for toggle play/pause
  }

  void playNext() {
    if (currentIndex < results.length - 1) {
      currentIndex++;
      playTrack(currentIndex);
    } else {
      seekTo(Duration.zero);
    }
  }

  void playPrev() {
    if (currentIndex > 0) {
      if (controller!.value.position.inSeconds > 3) {
        seekTo(Duration.zero);
      } else {
        currentIndex--;
        playTrack(currentIndex);
      }
    }
  }

  void toggleAutoplay() {
    autoplay = !autoplay;
    notifyListeners();
  }

  void seekTo(Duration position) {
    controller?.seekTo(position);
  }
}

enum PlayerState { idle, loading, playing, paused, error }

class Track {
  final String videoId;
  // Other fields can be added as needed

  Track(this.videoId);
}
