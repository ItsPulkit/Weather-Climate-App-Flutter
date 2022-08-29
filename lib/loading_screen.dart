import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'location_screen.dart';
import 'components/weather.dart';
const api_key='1c6ec0e975ff4ac4ee443687dde3b7c3';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var locationdata;
  bool rotate=true;
  WeatherModel weatherModel=WeatherModel();

  Future _determinePosition() async {
      WeatherModel weatherModel = WeatherModel();
      locationdata = await weatherModel.determinelocation();
      setState(() {
        rotate = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(locationdata);
      }));

  }

  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 1,
      color: Colors.red,
      inAsyncCall: rotate,
      child: Scaffold(
      ),
    );
  }
}
