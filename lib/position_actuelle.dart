import 'package:location/location.dart';

class LocationServices{
 Future<List<double>> positionActuelle() async {

    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        // return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        // return;
      }
    }

    _locationData = await location.getLocation();
    var latitude = _locationData.latitude;
    var longitude = _locationData.longitude;
    List<double> coordActuel = [latitude, longitude];

    return coordActuel;
  }
}
