import 'package:climatehere/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:climatehere/services/location.dart';
import 'package:climatehere/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


void main() {
  runApp(
      MaterialApp(
        home: MyApp(),
      )
  );

}
const apiKey = '9d40deef9602e036449739c7feba9d82';
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late double latitude;

  late double longitude;

  @override
  void initState() {
    super.initState();
    getLoctionData();
  }

  void getLoctionData() async {
    //Using the Location class imported from location.dart file
    //Getting the latitude and longitude of the location object (An object of Location class) and calling the getCurrentLocation method from Location class
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.longitude;
    longitude = location.latitude;
    //Using the NetworkHelper class imported from networking.dart
    //Calling getData method using networkHelper object (An object of NetworkHelper class)
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=imperial');
    //Calling the getData method of NetworkHelper class using networkHelper object and storing the data in the weatherData variable
    var weatherData = await networkHelper.getData();

    //Passing the data to the location_screen.dart(LocationScreen class in location_screen.dart) using the Navigator.push
    //LocationScreen class takes parameter locationWeather

    Navigator.push(context,MaterialPageRoute(builder:(context){
      return LocationScreen(locationWeather: weatherData,
      );
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.purple,
          size: 50.00,
        ),
      ),

    );
  }
}