import 'package:formation/Weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Weather>> fetchWeather() async {
  final response = await http.get(Uri.https(
    'www.infoclimat.fr',
    '/public-api/gfs/json',
    {
      '_ll': '48.85341,2.3488',
      '_auth': 'CBJeSQV7V3VVeAM0UiRWf1A4BzJbLQkuBHgCYQtuUC0HbAJjVDQGYARqAXwEKws9VnsAYwA7U2MHbAN7CXtVNAhiXjIFblcwVToDZlJ9Vn1QfgdmW3sJLgRvAmcLeFA1B2MCeFQ2BmIEbQF9BDULOFZlAH8AIFNqB2IDZQlhVTQIYl4/BW9XN1U+A35SfVZkUGMHY1tjCTYEYgI3C2JQNQdnAmBUYgYwBGIBfQQyCztWZgBmADlTYgdkA2MJe1UpCBJeSQV7V3VVeAM0UiRWf1A2BzlbMA==',
      '_c': '982b69a05a0cfa4de9289cb1b146cae1'
    }
  ));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return <Weather>[
      Weather.fromJson('2021-03-11 10:00:00', jsonDecode(response.body)),
      Weather.fromJson('2021-03-11 16:00:00', jsonDecode(response.body)),
    ];
  } else {
    throw Exception('Failed to load object');
  }
}
