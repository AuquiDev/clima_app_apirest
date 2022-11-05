import 'package:clima_app_apirest/widgets/item_forcat_widget.dart';
import 'package:clima_app_apirest/widgets/ui/reto_widget.dart';
import 'package:clima_app_apirest/widgets/ui/retos_seman_widget.dart';
import 'package:flutter/material.dart';

class HomePages extends StatelessWidget {
   HomePages({super.key});
  List week = [
    'Lunes', 'Martes','Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo'
  ];
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.location_on)),
        ],
      ),
      body: Padding(
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
                children: const [
                  Text(
                    '27',
                    style: TextStyle(
                        fontSize: 75,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text('ºC',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Arequipa, Peru',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
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
                    onPressed: () {},
                    child: const Text(
                      'Buscar',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
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
                    ...List.generate(10, (index) => const ItemForcatwidegt()),
                  ],
                ),
              ),
              RetoSemanaWidget(),
              ...List.generate(week.length, (index) => 
                weekWidget(texto: week[index],)
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _style() => const TextStyle(color: Colors.white);
}
