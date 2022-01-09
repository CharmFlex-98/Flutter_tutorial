import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function func;

  const NewTransaction(this.func, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController event = TextEditingController();
  final TextEditingController price = TextEditingController();
  DateTime? _chosenDate;

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019, 1, 1),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _chosenDate = pickedDate;
      });
    });
  }

  void submitData() {
    if (event.text.isEmpty ||
        price.text.isEmpty ||
        double.parse(price.text) < 0 ||
        _chosenDate == null) {
      return;
    }

    widget.func(event.text, double.parse(price.text), _chosenDate);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: "Event",
                ),
                controller: event,
                keyboardType: TextInputType.name,
              ),
              TextField(
                  decoration: const InputDecoration(labelText: "Price"),
                  controller: price,
                  keyboardType: TextInputType.number),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Text(_chosenDate == null
                        ? "No Date Selected"
                        : DateFormat.yMd().format(_chosenDate!)),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor)),
                        onPressed: _presentDatePicker,
                        child: Text("Choose Date"))
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => submitData(),
                child: const Text(
                  "Confirm",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
