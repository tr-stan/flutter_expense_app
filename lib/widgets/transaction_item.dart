import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);
  // constructor initializer list
  // allows forwarding Key from parent class

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.blueGrey,
      Colors.deepOrange,
      Colors.teal,
      Colors.indigo
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text('\$${widget.transaction.amount.toStringAsFixed(0)}'),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                textColor: Color(0xFF993344),
                label: const Text('Delete'),
                onPressed: () => widget.deleteTransaction(widget.transaction.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTransaction(widget.transaction.id),
              ),
      ),
    );
  }
}

// return Card(
//   elevation: 2,
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: <Widget>[
//       Container(
//         margin: EdgeInsets.symmetric(
//           vertical: 10,
//           horizontal: 15,
//         ),
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: Theme.of(context).dividerColor,
//             width: 2,
//           ),
//         ),
//         padding: EdgeInsets.all(10),
//         child: Text(
//           '\$${transactions[index].amount.toStringAsFixed(2)}',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//             color: Theme.of(context).primaryColor,
//           ),
//         ),
//       ),
//       // Flexible allows the rows in the column to fit
//       // their alotted space horizontally
//       Flexible(
//         child: Padding(
//           padding: const EdgeInsets.all(4.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               // ClipRect causes the text to wrap if too long
//               ClipRect(
//                 child: Text(
//                   transactions[index].title,
//                   style: Theme.of(context).textTheme.title,
//                 ),
//               ),
//               Text(
//                 DateFormat.yMMMd()
//                     .format(transactions[index].date),
//                 style: TextStyle(
//                   color: Colors.blueGrey,
//                   fontSize: 14,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       )
//     ],
//   ),
// )
