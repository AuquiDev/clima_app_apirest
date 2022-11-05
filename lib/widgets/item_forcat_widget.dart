import 'package:flutter/material.dart';

class ItemForcatwidegt extends StatelessWidget {
  const ItemForcatwidegt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16,bottom: 13),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 35),
      //height: 150,
      //width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(60)),
          color: Colors.white.withOpacity(.12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.16),
                offset: Offset(0, 5),
                blurRadius: 12)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '10:00 am',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(
            height: 6,
          ),
          Image.asset(
            'assets/images/dom.png',
            height: 38,
            color: Colors.white,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            '24 ºc',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
