import 'package:flutter/material.dart';

class CurrencyTile extends StatelessWidget {
  final String currency;
  final double value;
  CurrencyTile(this.currency, this.value);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text("$currency"),
        ),
        title: Text("1 USD = $currency ${value.toStringAsFixed(2)}"),
      ),
    );
  }
}
