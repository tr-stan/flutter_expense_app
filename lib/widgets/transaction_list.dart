import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions to show',
                  style: Theme.of(context).textTheme.title,
                ),
                // this SizedBox adds 20px of vertical space between the text
                // and the image Container
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  child: Image.asset(
                    'assets/images/Lines.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            )
          // ListView builder allows for a varied-length ListView
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      // Flexible allows the rows in the column to fit
                      // their alotted space horizontally
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // ClipRect causes the text to wrap if too long
                              ClipRect(
                                child: Text(
                                  transactions[index].title,
                                  style: Theme.of(context).textTheme.title,
                                ),
                              ),
                              Text(
                                DateFormat.yMMMd()
                                    .format(transactions[index].date),
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
