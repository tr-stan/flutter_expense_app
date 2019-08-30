import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  // Use a 'getter' to return a List of Maps where
  // the keys are type 'String', and  values are of varied type ('Object')
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      // get the day of the week for each iteration
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var transaction in recentTransactions) {
        if (transaction.date.day == weekDay.day &&
            transaction.date.month == weekDay.month &&
            transaction.date.year == weekDay.year) {
          totalSum += transaction.amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    // fold is like JS reduce func
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: groupedTransactionValues.map((data) {
          return Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChartBar(
                data['day'],
                data['amount'],
                totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
