import 'package:flutter/material.dart';
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
              return Card(
                elevation: 5,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 40,
                        child: FittedBox(
                          child: Text(
                            "\$${transactions[index].amount}",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              transactions[index].title,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                DateFormat("d LLL y  hh:m  EEE")
                                    .format(transactions[index].dateTime),
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ))
                        ],
                      ),
                    ),
                    IconButton(
                        color: Theme.of(context).errorColor,
                        iconSize: 40,
                        onPressed: () => deleteFunction(transactions[index].id),
                        icon: Icon(Icons.delete))
                  ],
                ),
              );
            },
          );
  }
}
