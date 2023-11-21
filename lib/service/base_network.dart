import 'package:latihanresponsi/model/blogs_model.dart';
import 'package:latihanresponsi/model/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:latihanresponsi/model/reports_model.dart';

class ApiSource {
  static const _News =
      'https://api.spaceflightnewsapi.net/v4/articles/?format=json';

  static const _Blog =
      'https://api.spaceflightnewsapi.net/v4/blogs/?format=json';

  static const _Reports =
      'https://api.spaceflightnewsapi.net/v4/reports/?format=json';

  Future<List<News>> getNews() async {
    final response = await http.get(Uri.parse(_News));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((news) => News.fromJson(news)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<List<Blog>> getBlog() async {
    final response = await http.get(Uri.parse(_Blog));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((blog) => Blog.fromJson(blog)).toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }

  Future<List<Report>> getReport() async {
    final response = await http.get(Uri.parse(_Reports));

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((report) => Report.fromJson(report)).toList();
    } else {
      throw Exception('Failed to load reports');
    }
  }
}
