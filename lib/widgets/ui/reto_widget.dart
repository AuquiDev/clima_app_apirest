import 'package:flutter/material.dart';

class RetoWidget extends StatelessWidget {
  const RetoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.1),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Clima San Francisco',
                    style: TextStyle(
                        color: Colors.white.withOpacity(.5), fontSize: 17),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Esse exercitation mollit est duis ex nostrud consequat commodo.',
                    style: TextStyle(
                        color: Colors.white.withOpacity(.5),
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Image.asset(
                'assets/images/nube.png',
                height: 100,
              ),
            ),
          )
        ],
      ),
    );
  }
}
