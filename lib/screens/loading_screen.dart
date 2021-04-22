import 'package:flutter/material.dart';
import 'package:weather_flutter/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void _getLocation() async {
    LocationService locationService = LocationService();
    await locationService.getCurrentLocation();
    print('from screen ${locationService.latitude}');
    print(locationService.longitude);
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
