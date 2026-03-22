class Track {
  final String id;
  final String title;
  final String channel;
  final String thumbnailUrl;

  Track({required this.id, required this.title, required this.channel, required this.thumbnailUrl});

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      id: json['id'],
      title: json['snippet']['title'],
      channel: json['snippet']['channelTitle'],
      thumbnailUrl: json['snippet']['thumbnails']['medium']['url'],
    );
  }
}