import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:week_1/provider_data.dart';

final String apiKey = 'b27fb207fe254d45991deff72f2939a8'; // Replace with your API key
final String baseUrl = 'https://newsapi.org/v2';

List<String> author = [];

List<String> title = [];
List<String> image = [];
List<String> description = [];

provider_data p1 = provider_data();

Future fetch_news() async {
  final url = Uri.parse('$baseUrl/top-headlines?country=us&apiKey=$apiKey');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    if (data['articles'] != null) {
      author.clear();
      title.clear();
      image.clear();
      description.clear();
      for (var i in data['articles']) {
        author.add(i['author'] ?? 'John Doe');
        title.add(i['title'] ?? 'No title');
        image.add(i['urlToImage'] ?? 'https://via.placeholder.com/150');
        description.add(i['description'] ?? 'No description');
      }
    } else {
      throw Exception('Failed to load news');
    }
    print(author);
    print(title);
    print(image);
    print(description);
  } else {
    throw Exception('Failed to load news');
  }
}
