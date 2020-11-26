import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:netflix_clon/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MultiProvider(providers: [
      Provider<AuthenticationService>(
        create: (_) => AuthenticationService(FirebaseAuth.instance),
      ),
      StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges)
    ]);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/img/netflix_logo.png",
          width: 45.0,
        ),
        Text(
          "Programas",
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        Text(
          "Peliculas",
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        Text(
          "Mi lista",
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        RaisedButton(
          child: Text("Salir", style: TextStyle(color: Colors.black),),
          onPressed: () {
          context.read<AuthenticationService>().signOut();
        })
      ],
    );
  }
}
