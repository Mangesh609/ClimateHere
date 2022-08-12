import 'package:flutter/material.dart';
import 'package:climatehere/widgets/weather_tile.dart';
import 'package:climatehere/services/networking.dart';

void main(){
  runApp(
      MaterialApp(
        home: LocationScreen(),
      )
  );
}

class LocationScreen extends StatefulWidget {
 LocationScreen({this.locationWeather});
 final locationWeather ;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temprature;
  late String weatherDescription;
  late  double minTemp;
  late  double maxTemp;
  late double windSpeed;
  late String cityName;
  late  int humidity;
  late double temp;
  late int mintemp;
  late int maxtemp;




  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
  }
  //Data that is passed from loading.dart is in the form of Map which have key-value pair
  //Obtaining that data and using as variables on the screen
  void updateUi(dynamic weatherData){
    if(weatherData == null){
      cityName = "Error";
      temp = "404" as double;
      weatherDescription = "error";
      minTemp="" as double;
      minTemp="" as double;
    }
    cityName = weatherData['name'];
    temp = weatherData['main']['temp'];
    weatherDescription = weatherData['weather'][0]['description'];
    minTemp= weatherData['main']['temp_min'];
    maxTemp = weatherData['main']['temp_max'];
    windSpeed = weatherData['wind']['speed'];
    humidity = weatherData['main']['humidity'];
    temprature = temp.toInt() ;
    temprature = temprature-6;
    minTemp = minTemp-7.20;
    mintemp = minTemp.toInt();
    maxtemp = maxTemp.toInt();

    if(cityName == null){
      cityName = "NA";
    }
    else{
      cityName = cityName ;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 2,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              color: Color(0xfff1f1f1),
              padding: EdgeInsets.fromLTRB(10, 80, 10, 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(

                  ),
                  Center(
                    child: Text("$cityName",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text('$temprature°C',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.purple,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Text("High $maxtemp°C , Low $mintemp°C",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    )
                    ,),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    WeatherTile(icon: Icons.thermostat_outlined,
                        title: "Temprature",
                        subtitle: "$temprature°C"),
                    WeatherTile(icon: Icons.filter_drama_outlined,
                        title: "Weather",
                        subtitle: "$weatherDescription"),
                    WeatherTile(icon: Icons.waves_outlined,
                        title: "WindSpeed",
                        subtitle: "$windSpeed MPH"),
                    WeatherTile(icon: Icons.water_drop,
                        title: "Humidity",
                        subtitle: "$humidity G/M³"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


