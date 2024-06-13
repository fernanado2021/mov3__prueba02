import 'package:flutter/material.dart';

void main() {
  runApp(Historial());
}

class Historial extends StatelessWidget {
  const Historial({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(context),
    );
  }
}

Widget Body(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Center(
        child: Text(
          'Historial de Movimientos',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 20), 
      Expanded(
        child: ListView(
          children: [
            TransactionCard(
              amount: 30,
              type: "Retiro",
              description: "Tipo: Impuestos",
              balance: 450,
            ),
            TransactionCard(
              amount: 50,
              type: "Depósito",
              description: "Tipo: Ingreso",
              balance: 500,
            ),
            TransactionCard(
              amount: 20,
              type: "Retiro",
              description: "Tipo: Compra",
              balance: 480,
            ),
          ],
        ),
      ),
    ],
  );
}

class TransactionCard extends StatelessWidget {
  final double amount;
  final String type;
  final String description;
  final double balance;

  const TransactionCard({
    required this.amount,
    required this.type,
    required this.description,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: Icon(Icons.account_balance_wallet),
        title: Text(
          "$type: \$$amount",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: Text(
          "Saldo: \$$balance",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
