import 'package:flutter/material.dart';

class TrendsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network("https://images-na.ssl-images-amazon.com/images/I/51f6ma2a4RL._AC_.jpg",
        width: 100.0,
        fit: BoxFit.cover,
        ),
        SizedBox(width: 10.0,)
      ],
    );
  }
}