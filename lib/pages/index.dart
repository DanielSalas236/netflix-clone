import 'package:flutter/material.dart';
import 'package:netflix_clon/components/banner_component.dart';
import 'package:netflix_clon/components/images_items.dart';
import 'package:netflix_clon/components/rounded_items.dart';
import 'package:netflix_clon/components/trends_items.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          BannerComponent(),
          this.horizontalList("Avances", RoundedItems(), 10),
          SizedBox(height: 15.0,),
          this.horizontalList("Peliculas chidas", ImagesItem(), 10),
          SizedBox(height: 15.0,),
          this.horizontalList("Tendencias", TrendsItem(), 10),
          SizedBox(height: 20.0,)
        ],
      ),
      bottomNavigationBar: bottomNav(),
    );
  }

  BottomNavigationBar bottomNav(){
    return BottomNavigationBar(
      backgroundColor: Colors.grey,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white38,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Inicio")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text("Buscar")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.new_releases),
          title: Text("Próximamente")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.download_sharp),
          title: Text("Descargas")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more),
          title: Text("Más"),
        ),
      ],
    );
  }

  Widget horizontalList(String title, Widget item, int cant) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0,),
            Container(
              height: 110.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cant,
                itemBuilder: (context, index){
                  return item;
                },
              ),
            ),
        ],
      ),
    );
  }
}
