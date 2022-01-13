import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatefulWidget {
  Transaction transactionCard;
  Function deleteFunction;

  TransactionCard(this.transactionCard, this.deleteFunction, {Key? key})
      : super(key: key);

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  late double size;
  _TransactionCardState() {
    print("create state");
    size = 20 + Random().nextDouble() * 10;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: size,
              child: FittedBox(
                child: Text(
                  "\$${widget.transactionCard.amount}",
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    widget.transactionCard.title,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      DateFormat("d LLL y  hh:m  EEE")
                          .format(widget.transactionCard.dateTime),
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
              onPressed: () => widget.deleteFunction(widget.transactionCard.id),
              icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
