import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions to show',
                  style: Theme.of(context).textTheme.title,
                ),
                // this SizedBox adds 20px of vertical space between the text
                // and the image Container
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/Lines.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            );
          })
        // ListView builder allows for a varied-length ListView
        : ListView(
            children: transactions
                .map((transaction) => TransactionItem(
                      // adding key forwarded to TransactionItem in its constructor
                      // key: UniqueKey(),
                      // unlike UniquKey(), ValueKey() doesn't (re)calculate
                      // a random value. It wraps a non-changing id provided by us
                      key: ValueKey(transaction.id),
                      transaction: transaction,
                      deleteTransaction: deleteTransaction,
                    ))
                .toList(),
          );
  }
}
