class Transaction {
  String id;
  String title;
  double amount;
  DateTime dateTime;

  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.dateTime});

  void testing() {
    List<int> test1 = [1, 2, 3, 4, 5];
    List<int> test2 = [for (var test in test1) test];
  }
}
