import 'package:flutter/cupertino.dart';
import 'package:weather/city_screen.dart';
import 'components/weather.dart';
import 'package:flutter/material.dart';
import 'components/update.dart';

class LocationScreen extends StatefulWidget {
  var locationdata;
  LocationScreen(this.locationdata);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
   WeatherModel current=WeatherModel();

    void initState(){
      super.initState;
      Update.updateUI(widget.locationdata);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Weather Plix"),
         backgroundColor: Colors.red,
         actions: <Widget>[
       IconButton(
       icon: Icon(
         Icons.info_outline_rounded,
         color: Colors.white,
       ),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                     child: Container(
                      child: Text("About Weather Plix : ", style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.all(20),
                    child: Text(
                      'Our App basically determines the current location of the user and displays various weather conditions like: Temperature, Weather Description, Humidity & Wind-Speed. We can also search for different locations and using Open-Weather API it will display the correct weather conditions.',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                    ),
                  ),
                ],
              );
            });
      }
       ),],
       ),
      drawer: Drawer(
             child:
             ListView(
             children: [
               ListTile(),
             ListTile(
               leading: Icon(Icons.location_on_rounded),
               title: Text("Live Location"),
             onTap:  () async{
               Navigator.pop(context);
               WeatherModel weathermodel = WeatherModel();
               var currentweatherdata = await weathermodel.determinelocation();
               setState(() {
                 Update.updateUI(currentweatherdata);
               });
             },
             ),
             ListTile(
               leading: Icon(Icons.search),
               title: Text("Search by city name"),
               onTap:
                 () async{
               var typename= await Navigator.push(context,
                   MaterialPageRoute(builder: (context) {
                     return CityScreen();
                   }));
               Navigator.pop(context);
               if(typename!=null) {
                 var data = await current.getLocationByCityName(typename);
                setState(() {
                  Update.updateUI(data);
                });
                 // updateUI(data);
               }
             },),
             ],
             )
             ),

             body: Column(
             children: [
             Expanded(
             child: Container(
             decoration: BoxDecoration(
             color: Colors.red,
             ),

              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding
                    (padding: EdgeInsets.only(bottom: 10.0),
                    child: Text('${Update.name}',style: TextStyle(fontSize: 14,color: Colors.white,fontWeight:
                    FontWeight.w600,
                    ),
                    ),
                  ),
                  Text('${Update.temperature.toString()}°C',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight:
                  FontWeight.w600,
                  ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0),
                    child: Text('${Update.climate}',style: TextStyle(fontSize: 14,color: Colors.white,fontWeight:
                    FontWeight.w600,
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded
            (
            flex:2,
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.thermostat_outlined),
                  title: Text('Temperature'),
                  trailing: Text('${Update.temperature.toString()}°C'),
                ),
                ListTile(
                  leading: Icon(Icons.cloud),
                  title: Text('Weather'),
                  trailing: Text(Update.weathermessage!.toUpperCase()),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Humidity'),
                  trailing: Text('${Update.humidity.toString()} %'),
                ),
                ListTile(
                  leading: Icon(Icons.air),
                  title: Text('Windspeed'),
                  trailing: Text('${Update.windspeed.toString()} m/s'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



