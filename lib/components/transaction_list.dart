import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  final void Function(
    String title,
  ) removeTransation;

  TransactionList(this.transactions, this.removeTransation);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Column(
            children: transactions
                .map((transaction) => Card(
                        child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '${NumberFormat.simpleCurrency(locale: 'pt_BR').format(transaction.value)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transaction.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                                DateFormat('dd MMM yyy')
                                    .format(transaction.date),
                                style: TextStyle(
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                        Container(
                          child: TextButton(
                            child: Text("X"),
                            style: TextButton.styleFrom(
                              primary: Colors.red[700],
                              alignment: Alignment.topRight,
                            ),
                            onPressed: () {
                              removeTransation(transaction.id);
                            },
                          ),
                        )
                      ],
                    )))
                .toList()),
      ],
    );
  }
}
