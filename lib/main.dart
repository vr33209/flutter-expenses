import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import '../components/transaction_user.dart';

main() => runApp(const ExpenseApp());

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Despesas Pessoais')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              child: Card(
                  child: Text('Gráfico'),
                  elevation: 5,
                  color: Colors.blueAccent)),
          TransactionUser(),
        ],
      ),
    );
  }
}
