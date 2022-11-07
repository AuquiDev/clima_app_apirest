
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CityNameProvider extends ChangeNotifier{
  String cityName = '';

  String country = '';

  double temp = 0;

  bool isloading = true;

  CityNameProvider(){

  }


  getCityNameProvider(String city) async {
    isloading = true;
    //setState(() {});
    Uri _url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=7c754f031b87b83b71da3437f2fc99c4');
    http.Response response = await http.get(_url);
    print(response.statusCode);
    print(response.body);

    //statucode = 200: si solo sale bien que ejecute esto
    if (response.statusCode == 200) {
      Map myMap = (json.decode(response.body));
      temp = myMap['main']['temp'];
      temp = temp - 273.15;
      cityName = myMap['name'];
      country = myMap['sys']['country'];
      isloading = false;
      //setState(() {});
    }

    // print(myMap['name']);
    // print(myMap['main']["temp"]);
    // print(myMap['sys']["country"]); mapa-lista

    // print(myMap['weather'][0]["description"]); mapa-lista-mapa
    //print(myMap['main']["temp_max"]);
  }

  // getCityNameProvider(){

  // }

}