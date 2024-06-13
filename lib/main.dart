import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba_02/screens/Login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Prueba02());
}

class Prueba02 extends StatelessWidget {
  const Prueba02({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba 02',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba'),
      ),
      body: Body(context),
    );
  }
}

Widget Body(context) {
  return Container(
    child: Center(
      child: (Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Nombre: Fernando Mallitaxi',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          const Text('Usuario Git: fernanado2021',
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
          BotonLogin(context)
        ],
      )),
    ),
  );
}

Widget BotonLogin(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Confirmación"),
            content: const Text("¿Estás seguro que deseas ir a Login?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancelar"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: const Text("Aceptar"),
              ),
            ],
          );
        },
      );
    },
    child: const Text(
      "Comenzar",
      style: TextStyle(fontSize: 15.0, color: Colors.white),
    ),
  );
}
