import 'dart:convert';

List<TransactionModel> transactionModelFromJson(String str) =>
    List<TransactionModel>.from(
        json.decode(str).map((x) => TransactionModel.fromJson(x)));

class TransactionModel {
  TransactionModel({
    required this.transferDate,
    required this.data,
  });

  DateTime transferDate;
  List<Datum> data;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        transferDate: DateTime.parse(json["transfer_date"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    required this.transactionCode,
    required this.date,
    required this.expenseId,
    required this.amount,
    required this.cardId,
    required this.receiver,
  });

  int transactionCode;
  DateTime date;
  int expenseId;
  num amount;
  int cardId;
  Receiver receiver;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        transactionCode: json["transaction_code"],
        date: DateTime.parse(json["date"]),
        expenseId: json["expense_id"],
        amount: json["amount"],
        cardId: json["card_id"],
        receiver: Receiver.fromJson(json["receiver"]),
      );
}

class Receiver {
  Receiver({
    required this.brandImage,
    required this.name,
    required this.location,
  });

  String brandImage;
  String name;
  String location;

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
        brandImage: json["brand_image"],
        name: json["name"],
        location: json["location"],
      );
}
