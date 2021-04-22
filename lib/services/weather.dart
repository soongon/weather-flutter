import 'package:weather_flutter/services/location.dart';
import 'package:weather_flutter/services/networking.dart';

class WeatherModel {
  //TODO
  Future<dynamic> getWeatherByCityName() {}

  Future<dynamic> getWeatherByCurrentLocation() async {
    LocationService locationService = LocationService();
    await locationService.getCurrentLocation();

    ApiHelper apiHelper = ApiHelper();
    var resultJson = await apiHelper.getWeatherJsonFromLocation(
        locationService.latitude, locationService.longitude);

    return resultJson;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
