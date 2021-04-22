import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_flutter/screens/location_screen.dart';
import 'package:weather_flutter/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void _getWeatherWithLocation() async {
    WeatherModel model = WeatherModel();
    dynamic resultJson = await model.getWeatherByCurrentLocation();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData: resultJson);
    }));
  }

  @override
  void initState() {
    super.initState();
    _getWeatherWithLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
