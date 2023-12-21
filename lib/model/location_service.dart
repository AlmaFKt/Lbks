
import 'package:location/location.dart';

class LocationService {
  static Future<Map<String, double>> getUserLocation() async {
    Location location = Location();
    LocationData locationData = await location.getLocation();
    double latitude = locationData.latitude!;
    double longitude = locationData.longitude!;
    return {'latitude': latitude, 'longitude': longitude};
  }
}
