// now_playing_card.dart

import 'package:flutter/material.dart';

class NowPlayingCard extends StatefulWidget {
  @override
  _NowPlayingCardState createState() => _NowPlayingCardState();
}

class _NowPlayingCardState extends State<NowPlayingCard> {
  bool isPlaying = false;
  bool autoplay = false;

  void togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void toggleAutoplay() {
    setState(() {
      autoplay = !autoplay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          // Animated Equalizer Widget Placeholder
          Container(
            height: 50,
            child: Center(child: Text('Animated Equalizer Placeholder')), // Replace with the actual equalizer widget
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: togglePlayPause,
              ),
              IconButton(
                icon: Icon(autoplay ? Icons.loop : Icons.loop_outlined),
                onPressed: toggleAutoplay,
              ),
            ],
          ),
        ],
      ),
    );
  }
}