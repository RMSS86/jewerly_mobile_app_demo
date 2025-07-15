
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Services/Weather/WeatherService.dart';
import '../../models/weather/WeatherModel.dart';

import 'package:google_fonts/google_fonts.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

//weather Animations
class _WeatherPageState extends State<WeatherPage> {
  static String APIKEY = '[YOUR_WEATHER_API_KEY_HERE]';

//API
  final _weatherService = WeatherService(APIKEY);
  Weather? _weather;

//fetch Weather
  _fetchWeather() async{
    String _cityName = await _weatherService.getCurrentCity();
    try{
      final weather = await _weatherService.getWeather(_cityName);
      setState((){
        _weather = weather;
      });
    }catch(e){
      print(e);
    }
  }

  String getWeatherAnimation(String? mainCondition){
    if (mainCondition == null ) return 'assets/UI/EmptyCart.json';

    switch (mainCondition.toLowerCase()){
      case 'clouds':
      case 'haze':
      case 'fog':
        return 'assets/Weather/PartlyCloudyDay.json';

      case 'dust':
      case 'mist':
      case 'smoke':
        return 'assets/Weather/PartlyCloudyDay.json';


      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/Weather/Rainny_Day.json';

      default:
        return 'assets/Weather/Sunny.json';
    }
  }

  @override
  void initState(){
    super.initState();
    _fetchWeather();

  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      child: Container(
      
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(12),
      
        ),
        // padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 25.0),
        padding: EdgeInsets.symmetric(horizontal: 50,vertical: 30),
        margin: EdgeInsets.only(left:18.0, right: 18.0,top: 0,bottom: 10),
      
        child:Center(
          child: Column(
      
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
      
              Text(_weather?.cityName ?? 'Loading',
                style: GoogleFonts.bebasNeue(fontSize: 30,
                    color: Colors.grey.shade300),),
            // color: Theme.of(context).colorScheme.surface),),
      
      
              Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
      
              Text('${_weather?.temperature.round()}°C' ?? '--°C',
                style: GoogleFonts.bebasNeue(fontSize: 27,
                    color: Colors.grey.shade300),),
      
              Text(_weather?.mainCondition ?? 'please wait',
                style: GoogleFonts.bebasNeue(fontSize: 27,
                    color: Colors.grey.shade300),),
      
            ],
          ),
        ) ,
      
      ),
    );
  }
}
