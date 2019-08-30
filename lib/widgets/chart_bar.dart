import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentageOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPercentageOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // FittexBox forces child to shrink to fit
        FittedBox(
        // rounded amount spent on this day
          child: Text('\$${spendingAmount.toStringAsFixed(0)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        ),
        // SizedBox for spacing
        SizedBox(
          height: 6,
        ),
        // This container is our main bar
        Container(
          height: 60,
          width: 10,
          // Stack widget allows you to layer/overlap widgets
          child: Stack(
            children: <Widget>[
              // Bottom-most widget layer, colored background
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 1.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // overlay to partially 'fill' the bar:
              // heightFactor of FractionallySizedBox takes value between 0 & 1
              FractionallySizedBox(
                heightFactor: spendingPercentageOfTotal,
                // Container needed to add decoration to this fractional box
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        // SizedBox for spacing
        SizedBox(
          height: 6,
        ),
        // label for the weekday
        Text(label),
      ],
    );
  }
}
