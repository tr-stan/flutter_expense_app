import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Nike Running Shoes',
      amount: 54.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Central Market Hazelnut Chocolate',
      amount: 2.50,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.deepOrange,
              elevation: 5,
              child: Text('EXPENSES CHART'),
            ),
          ),
          Container(
            child: Card(
              color: Color(0xFF33AA88),
              elevation: 2,
              child: Text('LIST OF EXPENSE ITEMS'),
            ),
          )
        ],
      ),
    );
  }
}
