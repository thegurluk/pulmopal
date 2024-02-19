import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationServices {
  final String key = 'AIzaSyCafSBXx899kXz9-1PA6f851t7u4eHeFlA';

  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&inputtype=textquery&key=$key';

    var response = await http.get(Uri.parse(url));

    var json = convert.jsonDecode(response.body);

    var placeId = json['candidates'][0]['place id'] as String;

    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);

    final String url =
        'https://maps.googleapis.com/maps/api/place/findplaceformtext/json?place_id=$placeId&key=$key';

    var response = await http.get(Uri.parse(url));

    var json = convert.jsonDecode(response.body);
    final results = json['result'] as Map<String, dynamic>;

    return results;
  }
}
