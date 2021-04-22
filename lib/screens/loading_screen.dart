import 'package:flutter/material.dart';
import 'package:weather_flutter/services/location.dart';
import 'package:weather_flutter/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void _getWeatherWithLocation() async {
    LocationService locationService = LocationService();
    await locationService.getCurrentLocation();

    ApiHelper apiHelper = ApiHelper();
    var resultJson = await apiHelper.getWeatherJsonFromLocation(
        locationService.latitude, locationService.longitude);
    print(resultJson);
  }

  @override
  void initState() {
    super.initState();
    _getWeatherWithLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
