import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widget/transactionCard.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;
  Function deleteFunction;

  TransactionList(this.deleteFunction, this.transactions);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              const Text("No transaction added yet"),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: 200,
                  child: Image.asset(
                    "assets/images/noData.jpg",
                    fit: BoxFit.cover,
                  ))
            ],
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return TransactionCard(
                transactions[index],
                deleteFunction,
                key: ValueKey(transactions[index].id),
              );
            },
          );
  }
}
