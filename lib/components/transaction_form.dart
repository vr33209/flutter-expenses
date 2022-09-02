import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String title, double value) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Titulo',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
              controller: valueController,
            ),
            TextButton(
              child: Text("Nova transação"),
              style: TextButton.styleFrom(
                primary: Colors.purpleAccent,
              ),
              onPressed: () {
                var title = titleController.text;
                var value = double.tryParse(valueController.text) ?? 0;
                onSubmit(title, value);
              },
            )
          ]),
        ));
  }
}
