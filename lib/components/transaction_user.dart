import 'dart:math';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'transaction_list.dart';
import 'transaction_form.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: 't1', title: 'Novo Tenis', value: 310.76, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    if (title.length > 0 && value > 0) {
      var newTransaction = new Transaction(
        id: Random().nextDouble().toString(),
        date: DateTime.now(),
        title: title,
        value: value,
      );

      setState(() {
        _transactions.add(newTransaction);
      });
    }
  }

  _removeTransaction(String transanctionId) {
    setState(() {
      _transactions
          .removeWhere((transanction) => transanction.id == transanctionId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions, _removeTransaction),
        TransactionForm(_addTransaction),
      ],
    );
  }
}
