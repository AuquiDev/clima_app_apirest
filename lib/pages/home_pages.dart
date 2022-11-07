import 'package:clima_app_apirest/widgets/item_forcat_widget.dart';
import 'package:clima_app_apirest/widgets/ui/reto_widget.dart';
import 'package:clima_app_apirest/widgets/ui/retos_seman_widget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePages extends StatefulWidget {
  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  String cityName = '';

  String country = '';

  double temp = 0;

  bool isloading = true;

  final TextEditingController _seachController = TextEditingController();

  @override
  initState() {
    super.initState();
    getData('Urubamba'); //cuando el aplicativo inicie llame a get data location
    //getDatLocation();
  }

  getData(String city) async {
    isloading = true;
    setState(() {});
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
      setState(() {});
    }

    // print(myMap['name']);
    // print(myMap['main']["temp"]);
    // print(myMap['sys']["country"]); mapa-lista

    // print(myMap['weather'][0]["description"]); mapa-lista-mapa
    //print(myMap['main']["temp_max"]);
  }

  getDatLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    isloading = true;
    setState(() {});

    Position position =
        await Geolocator.getCurrentPosition(); //obtener la posicion actual
    print(position);
    print(position.latitude);
    print(position.longitude);
    print(position.altitude);

    Uri _url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=7c754f031b87b83b71da3437f2fc99c4');
    http.Response response = await http.get(_url);
    if (response.statusCode == 200) {
      Map myMap = (json.decode(response.body));
      temp = myMap['main']['temp'];
      temp = temp - 273.15;
      cityName = myMap['name'];
      country = myMap['sys']['country'];
      isloading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232535),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Clima App'),
        actions: [
          IconButton(
              onPressed: () {
                getDatLocation();
              },
              icon: const Icon(Icons.location_on)),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/dom.png',
                      height: 60,
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${temp.toStringAsFixed(1)}',
                          style: const TextStyle(
                              fontSize: 75,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text('ºC',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$cityName, $country',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _seachController,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          hintText: 'Ingresa una ciudad',
                          hintStyle: const TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(.1),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none)),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfffe6c6d),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14))),
                          onPressed: () {
                            String city = _seachController.text;
                            getData(city);
                          },
                          child: const Text(
                            'Buscar',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Today',
                            style: _style(),
                          ),
                          Text(
                            'Tomorrow',
                            style: _style(),
                          ),
                          Text(
                            '7 Days',
                            style: _style(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                              10, (index) => const ItemForcatwidegt()),
                        ],
                      ),
                    ),
                    // RetoSemanaWidget(),
                    // ...List.generate(week.length, (index) =>
                    //   weekWidget(texto: week[index],)
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 26, horizontal: 14),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.12),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14))),
                      child: Stack(clipBehavior: Clip.none, children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              '14 minutes',
                              style: TextStyle(color: Colors.white60),
                            ),
                            Text(
                              'Laboris nisi minim ex laboris laboris magna Lorem eu eu do aliqua adipisicing.',
                              style: TextStyle(color: Colors.white60),
                            ),
                          ],
                        ),
                        Positioned(
                          top: -80,
                          right: 10,
                          child: Image.asset('assets/images/nube.png'),
                          height: 100,
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
          isloading
              ? Container(
                  color: const Color(0xff232535).withOpacity(0.98),
                  child: const Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Color(0xffFE6C6D),
                        strokeWidth: 1.5,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  TextStyle _style() => const TextStyle(color: Colors.white);
}
