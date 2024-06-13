import 'package:flutter/material.dart';
import 'package:prueba_02/main.dart';
import 'package:prueba_02/screens/Historial.dart';

void main() {
  runApp(Cuenta());
}

class Cuenta extends StatelessWidget {
  const Cuenta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cuenta',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indice = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Body(context),
      const Historial(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuenta'),
      ),
      body: screens[indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (valor) {
          setState(() {
            indice = valor;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: "Cuenta",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Historial",
          ),
        ],
      ),
    );
  }
}

Widget Body(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/img/user.png"),
        ),
        SizedBox(height: 20),
        Text(
          "Número de cuenta: 1234567890",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
        Text(
          "Valor total de la cuenta: \$1000.00",
          style: TextStyle(fontSize: 18),
        ),
      ],
    ),
  );
}
