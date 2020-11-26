import 'package:flutter/material.dart';

class RoundedItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: 110.0,
              width: 110.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(110.0),
                  border: Border.all(color: Colors.yellow, width: 2.0)),
              child: ClipOval(
                  child: Image.network(
                "https://diariodeavisos.elespanol.com/wp-content/uploads/2020/04/yoserieadicto-Series-Netflix-Belen_Cuesta-Ursula_Corbero-Series_479712797_149650305_1706x960.jpg",
                fit: BoxFit.cover,
              )),
            ),
            Image.asset("assets/img/papel_titulo.png", width: 110.0,)
          ],
        ),
        SizedBox(width: 10.0,)
      ],
    );
  }
}
