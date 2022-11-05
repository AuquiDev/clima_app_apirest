import 'package:clima_app_apirest/widgets/ui/reto_widget.dart';
import 'package:flutter/material.dart';

class RetoSemanaWidget extends StatelessWidget {
  RetoSemanaWidget({super.key,});

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RetoWidget(),
        //3 puntitos
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                3,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 3),
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(.2),
                        radius: 4,
                      ),
                    ))
          ],
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Next Week',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
       
      ],
    );
  }
}

class weekWidget extends StatelessWidget {
  const weekWidget({
    Key? key,
    required this.texto,
  }) : super(key: key);

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Container(
            width: 100,
             child: Text(
              texto,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
          ),
           ),
          Row(
            children: [
              const Text(
                '28 º',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '21 º',
                style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Image.asset(
            'assets/images/dom.png',
            height: 25,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
