import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/track.dart';

class YouTubeService {
  static const String _apiKey = 'AIzaSyAt2jHv1pHVUjG6HLgsTNL4AbNh9Pjh5eU';
  static const String _baseUrl = 'https://www.googleapis.com/youtube/v3/search';

  Future<List<Track>> search(String query) async {
    try {
      final String searchQuery = '[0m$query music';
      final response = await http.get(Uri.parse(_baseUrl).replace(queryParameters: {'part': 'snippet', 'type': 'video', 'videoCategoryId': '10', 'maxResults': '15', 'q': searchQuery, 'key': _apiKey,},),);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List items = data['items'] ?? [];
        return items.map((item) => Track.fromJson(item)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}