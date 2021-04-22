import 'package:flutter/material.dart';
import 'package:weather_flutter/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            LocationService locationService = LocationService();
            await locationService.getCurrentLocation();
            print(locationService.latitude);
            print(locationService.longitude);
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
