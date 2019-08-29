import 'package:flutter/material.dart';

// having this as a StatefulWidget allows the data submitted
// through the inputs in the modal to get captured and added properly
class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    // simple form validation before invoking addTransaction
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    // 'widget' gives this State class access to the NewTransaction class above
    widget.addTransaction(enteredTitle, enteredAmount);

    // closes modal sheet once form is submitted
    // (context refers to automatic context of the State widget)
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 40),
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                // onChanged: (value) => titleInput = value,
                controller: titleController,
                // the "_" param below signals that the argument must be accepted
                // but we don't plan on using it for anything
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                // onChanged: (value) => amountInput = value,
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitData(),
              ),
              FlatButton(
                child: Text('Add Transaction'),
                textColor: Theme.of(context).primaryColor,
                onPressed: submitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
