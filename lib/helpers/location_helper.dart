import 'dart:convert';
import 'package:http/http.dart' as http;

const GOOGLE_API_KEY =
    'AIzaSyBsJ5i5rLUb9RWq_PEI8lgtH40LJyFEILk'; // from the firbase_flutter_shop app

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return '''https://maps.googleapis.com/maps/api/staticmap?$latitude,$longitude
    &zoom=13
    &size=600x300
    &maptype=roadmap
    &markers=color:red%7Clabel:C%7C$latitude,$longitude
    &key=$GOOGLE_API_KEY''';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY');

    final response = await http.get(url);
    // below is kind gross but ok
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}

// class LocationHelper {
//   static String generateLocationPreviewImage(
//       {double latitude, double longitude}) {
//     return 'https://maps.googleapis.com/maps/api/staticmap?$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
//   }
// }
