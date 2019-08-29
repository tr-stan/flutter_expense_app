// this class serves merely as a blueprint for data
// and will not be used as a widget, so it does not extend
// stateless or stateful widgets
import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}
