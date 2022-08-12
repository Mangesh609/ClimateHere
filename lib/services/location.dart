import 'package:geolocator/geolocator.dart';
//Using this package we are going to get the user location
class Location{
  late double latitude;
  late double longitude;
  Future getCurrentLocation() async{
    try{
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
     latitude = position.latitude;
     longitude = position.longitude;
     //this longitude and the latitude values are passed to the loading.dart file by importing this dart file
    }
    catch(e) {
      print(e);
    }
  }
}
