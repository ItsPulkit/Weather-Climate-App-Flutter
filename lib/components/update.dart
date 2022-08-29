import 'package:weather/components/weather.dart';

class Update{
  static String? temperature;
  static double? humidity;
  static String? name;
  static double? windspeed;
  static String? weathermessage;
  static String? climate;


  static void updateUI(dynamic locationdata) {

      if (locationdata == null) {
        temperature = " ";
        name = "Location Not Found ";
        windspeed=0;
        weathermessage=" ";
        humidity=0;
        climate=' ';
        return;
      }

      double temp = locationdata['main']['temp'];
      temperature = (temp.toInt()).toString();
      climate=locationdata['weather'][0]['main'];
      name = locationdata['name'];
      weathermessage=locationdata['weather'][0]['description'];
      var wind=locationdata['wind']['speed'];
      windspeed=double.parse(wind.toString());
      var humid=locationdata['main']['humidity'];
      humidity=double.parse(humid.toString());

  }
}
