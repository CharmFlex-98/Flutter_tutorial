import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/transaction.dart';
import 'package:flutter_tutorial/widget/chartBar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions, {Key? key}) : super(key: key);

  double getSumOfGroupTransaction() {
    return _getGroupTransactionValues().fold(0, (previousValue, element) {
      return previousValue + (element["amount"] as double);
    });
  }

  List<Map<String, Object>> _getGroupTransactionValues() {
    List<Map<String, Object>> groupTransaction = [];

    for (int i = 6; i >= 0; i--) {
      var weekDay = DateTime.now().subtract(Duration(days: i));
      double totalSum = 0;

      for (int j = 0; j < recentTransactions.length; j++) {
        if (recentTransactions[j].dateTime.day == weekDay.day &&
            recentTransactions[j].dateTime.month == weekDay.month &&
            recentTransactions[j].dateTime.year == weekDay.year) {
          totalSum += recentTransactions[j].amount;
        }
      }
      groupTransaction.add({
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      });
    }

    return groupTransaction;
  }

  @override
  Widget build(BuildContext context) {
    print(_getGroupTransactionValues());
    return Card(
        color: Colors.red,
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var day in _getGroupTransactionValues())
                Expanded(
                  child: ChartBar(
                      day["day"] as String,
                      day["amount"] as double,
                      getSumOfGroupTransaction() != 0
                          ? (day["amount"] as double) /
                              getSumOfGroupTransaction()
                          : 0),
                )
            ],
          ),
        ));
  }
}
