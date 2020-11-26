import 'package:flutter/material.dart';
import 'package:netflix_clon/components/top_navbar.dart';

class BannerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [this.header(), this.serieInfo(), this.serieButtons()],
    );
  }

  Widget header() {
    return Stack(
      children: [
        Image(
          image: NetworkImage(
              "https://t1.salir.ltmcdn.com/es/posts/4/2/0/series_post_apocalipticas_recomendadas_24_0_600.jpg"),
          height: 350.0,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 350.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.black38, Colors.black])),
        ),
        SafeArea(child: TopNavbar())
      ],
    );
  }

  Widget serieInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Telenovelesco",
          style: TextStyle(color: Colors.white, fontSize: 13.0),
        ),
        Icon(
          Icons.fiber_manual_record,
          color: Colors.red,
          size: 8.0,
        ),
        Text(
          "Suspenso insostenible",
          style: TextStyle(color: Colors.white, fontSize: 13.0),
        ),
        Icon(
          Icons.fiber_manual_record,
          color: Colors.red,
          size: 8.0,
        ),
        Text(
          "De suspenso",
          style: TextStyle(color: Colors.white, fontSize: 13.0),
        ),
        Icon(
          Icons.fiber_manual_record,
          color: Colors.red,
          size: 8.0,
        ),
        Text(
          "Adoles",
          style: TextStyle(color: Colors.white, fontSize: 13.0),
        )
      ],
    );
  }

  Widget serieButtons() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.check, color: Colors.white),
            SizedBox(height: 3.0,),
            Text("Mi lista", style: TextStyle(color: Colors.white, fontSize: 10.0),)
          ],
        ),
        FlatButton.icon(
          color: Colors.white,
            onPressed: () {},
            icon: Icon(
              Icons.play_arrow,
              color: Colors.black,
            ),
            label: Text("Reproducir")),
        Column(
          children: [
            Icon(Icons.info_outline, color: Colors.white),
            SizedBox(height: 3.0,),
            Text("Información", style: TextStyle(color: Colors.white, fontSize: 10.0),)
          ],
        )
      ],
    ),
  );
}

}
