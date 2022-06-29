import 'dart:convert';

import 'package:post_box/utils/userSharedPreferences.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  final _baseUrl = "http://makjac.pl:8080";

  Future<int> loginUser(Map<String, String> loginObj) async {
    try {
      final response =
          await http.post(Uri.parse(_baseUrl + "/login"), body: loginObj);

      final data = jsonDecode(response.body);
      await UserSharedPreferences.setToken(data["token"]);
      return response.statusCode;
    } catch (e) {
      await UserSharedPreferences.setToken("");
      await UserSharedPreferences.setLogin("");
      return 0;
    }
  }

  Future<int> registerUser(Map<String, String> registerObj) async {
    try {
      //print(registerObj["Name"]);
      final response =
          await http.get(Uri.http("makjac.pl:8080", "/register", registerObj));

      return response.statusCode;
    } catch (e) {
      return 0;
    }
  }

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

  Future<List<dynamic>> fetchIncomingParcels() async {
    try {
      final token = UserSharedPreferences.getToken();

      final response = await http
          .get(Uri.parse(_baseUrl + "/api/parcels/incoming"), headers: {
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

  Future<List<dynamic>> fetchSendingParcels() async {
    try {
      final token = UserSharedPreferences.getToken();

      final response =
          await http.get(Uri.parse(_baseUrl + "/api/parcels/send"), headers: {
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

  Future<List<dynamic>> fetchPstmachines() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + "/postmachine"));

      final res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return res["data"];
      }
    } catch (e) {
      return [];
    }
    return [];
  }

  Future<int> createParcel(Map<String, String> parcelObj) async {
    try {
      final response = await http.post(
          Uri.parse(_baseUrl + "/api/parcels/create"),
          headers: parcelObj);
      return response.statusCode;
    } catch (e) {
      return 0;
    }
  }

  Future<List<dynamic>> fetchParcelHistory(String uuid) async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + "/parcel/history"),
          headers: {"parcel_uuid": uuid});
      final res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return res["data"];
      }
    } catch (e) {
      return [];
    }
    return [];
  }

  Future<List<dynamic>> fetchParcelDestination(String uuid) async {
    try {
      final response = await http.get(
          Uri.parse(_baseUrl + "/parcel/destination"),
          headers: {"puuid": uuid});
      final res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return res["data"];
      }
    } catch (e) {
      return [];
    }
    return [];
  }

  Future<int> updatePrifile(Map<String, String> profileObj) async {
    try {
      final response = await http.post(
          Uri.parse(_baseUrl + "/api/showcase/update"),
          headers: profileObj);

      return response.statusCode;
    } catch (e) {
      return 0;
    }
  }
}
