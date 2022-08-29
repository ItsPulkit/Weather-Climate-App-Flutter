import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather/components/location.dart';
import 'package:weather/components/network.dart';
const api_key='1c6ec0e975ff4ac4ee443687dde3b7c3';


class WeatherModel{
  var locationdata;

  Future getLocationByCityName(String cityname) async{
    Response response=await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=${cityname}&appid='
        '${api_key}&units=metric'));
    if(response.statusCode==200){
      var data=response.body;
      print(data);
      return jsonDecode(data);
    }
    else{
      print(response.statusCode);
    }
  }

  Future determinelocation() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    if (loc.latitude == -100 || loc.longitude == -100) {
      locationdata = null;
    }
    else {
      Network net = Network(
          'https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=${api_key}&units=metric');
      locationdata = await net.getData();
      print(locationdata);
      return locationdata;
    }
  }
}