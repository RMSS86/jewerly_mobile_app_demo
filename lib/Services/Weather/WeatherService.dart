import 'dart:convert';
import '../../models/weather/WeatherModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

class WeatherService
{

    static const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
    final String APIkey;

    WeatherService(this.APIkey);

    Future<Weather> getWeather(String cityName) async
    {
        final _response = await http.get(Uri.parse('$openWeatherMapURL?q=$cityName&appid=$APIkey&units=metric'));
        if (_response.statusCode == 200) 
        {
            return Weather.fromJson(jsonDecode(_response.body));
        }
        else 
        {
            throw Exception('Falied to Get Weather at this time');
        }
    }

    Future<String> getCurrentCity() async
    {
        LocationPermission _permission = await Geolocator.requestPermission();
        if (_permission == LocationPermission.denied) 
        {
            _permission = await Geolocator.requestPermission();
        }

        Position position_ = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high
        );

        List<Placemark> placemarks_ = await placemarkFromCoordinates(position_.latitude, position_.longitude);
        // print(placemarks_[1].locality);
        String? city_ = placemarks_[1].locality;

        return city_ ?? '';
    }
}
