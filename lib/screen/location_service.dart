import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class LocationService {
  final String key = 'AIzaSyAyMazbI1hv6BftT6efH4bQIdfZ5YYH1Gg';

  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&fields=place_id&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var placeId = json['candidates'][0]['place_id'] as String;
    print(placeId);
    return placeId;
  }

  // Future<Map<String, dynamic>> getPlaceId(String input) async{}
}
