import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  String? cityname;
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: 'Enter city name',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      icon:Icon( Icons.location_city,),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15.0)),)
                  ),
                  onChanged: (value){
                    cityname=value;
                  },
                ),
              ),

              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.red)),
                onPressed: () {
                  Navigator.pop(context,cityname);
                },
                child: Text(
                  'Get Weather',
                ),
              ),

            SizedBox(height: 10,),

              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                child: Text("Popular Cities: ", style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),),
              ),

              SizedBox(height: 10,),

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                    onPressed: () {
                      cityname = "Delhi";
                      Navigator.pop(context,cityname);
                    },
                    child: Text(
                        "Delhi"
                    )),

                FlatButton(
                    onPressed: () {
                      cityname = "Mumbai";
                      Navigator.pop(context,cityname);
                    },
                    child: Text(
                        "Mumbai"
                    )),

                FlatButton(
                    onPressed: () {
                      cityname = "Kolkata";
                      Navigator.pop(context,cityname);
                    },
                    child: Text(
                        "Kolkata"
                    )),

                FlatButton(
                    onPressed: () {
                      cityname = "Goa";
                      Navigator.pop(context,cityname);
                    },
                    child: Text(
                        "Goa"
                    )),
              ],
            ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                      onPressed: () {
                        cityname = "Pune";
                        Navigator.pop(context,cityname);
                      },
                      child: Text(
                          "Pune"
                      )),

                  FlatButton(
                      onPressed: () {
                        cityname = "Agra";
                        Navigator.pop(context,cityname);
                      },
                      child: Text(
                          "Agra"
                      )),

                  FlatButton(
                      onPressed: () {
                        cityname = "Jaipur";
                        Navigator.pop(context,cityname);
                      },
                      child: Text(
                          "Jaipur"
                      )),

                  FlatButton(
                      onPressed: () {
                        cityname = "Bengaluru";
                        Navigator.pop(context,cityname);
                      },
                      child: Text(
                          "Bengaluru"
                      )),

                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
