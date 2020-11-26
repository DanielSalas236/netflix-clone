import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clon/pages/index.dart';
import 'package:netflix_clon/services/authentication_service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges)
      ],
      child: MaterialApp(
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser == null) {
      return AuthenticationPage();
    }
    return IndexPage();
  }
}

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _validate = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: cuerpo(context));
  }

  Widget cuerpo(context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://qualfind.com/wp-content/uploads/2019/03/cropped-black-chrome-gradient-ui-gradient-background.jpg"),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/netflix_logo.png",
              width: 70.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            titulo(),
            campoUser(),
            campoPass(),
            SizedBox(
              height: 15,
            ),
            botonEntrar(context)
          ],
        ),
      ),
    );
  }

  Widget titulo() {
    return Text("Sign In",
        style: TextStyle(
            color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold));
  }

  Widget campoUser() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: TextField(
        controller: emailController,
        decoration: InputDecoration(
            hintText: "Email",
            fillColor: Colors.white,
            filled: true,
            errorText: _validate ? 'Please fill this field' : null),
      ),
    );
  }

  Widget campoPass() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: TextField(
        obscureText: true,
        controller: passwordController,
        decoration: InputDecoration(
            hintText: "Password",
            fillColor: Colors.white,
            filled: true,
            errorText: _validate ? 'Please fill this field' : null),
      ),
    );
  }

  Widget botonEntrar(BuildContext context) {
    return RaisedButton(
      color: Colors.red,
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      onPressed: () {
        setState(() {
          emailController.text.isEmpty ? _validate = true : _validate = false;
          passwordController.text.isEmpty
              ? _validate = true
              : _validate = false;
        });
        context.read<AuthenticationService>().signIn(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            context: context);
      },
      child: Text(
        "Sign in",
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );
  }
}
