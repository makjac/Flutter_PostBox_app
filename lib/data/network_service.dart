import 'dart:convert';

import 'package:post_box/utils/userSharedPreferences.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  final _baseUrl = "http://makjac.pl:8080";

  Future<List<dynamic>> fetchShowcase() async {
    try {
      final token = UserSharedPreferences.getToken();

      final response =
          await http.get(Uri.parse(_baseUrl + "/api/showcase"), headers: {
        'Authorization': 'Bearer $token',
      });
      final res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return res["data"];
      }
    } catch (e) {
      return [];
    }
    return [];
  }
}