import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionHandler;

  NewTransaction(this.addTransactionHandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // const NewTransaction({Key key}) : super(key: key);
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitTransaction() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;

    if (enteredTitle.isEmpty || double.parse(enteredAmount) <= 0) {
      return;
    }

    widget.addTransactionHandler(
      enteredTitle,
      double.parse(enteredAmount),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'What has spent on?'),
              // onChanged: (val) => expenseInput = val,
              controller: titleController,
              onSubmitted: (_) => submitTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) => amountInput = val,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitTransaction(),
            ),
            TextButton(
              onPressed: submitTransaction,
              child: Text(
                'Add Expense',
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
