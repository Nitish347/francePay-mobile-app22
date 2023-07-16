// To parse this JSON data, do
//
//     final transactionDetailsModel = transactionDetailsModelFromJson(jsonString);

import 'dart:convert';

TransactionDetailsModel transactionDetailsModelFromJson(String str) =>
    TransactionDetailsModel.fromJson(json.decode(str));

String transactionDetailsModelToJson(TransactionDetailsModel data) =>
    json.encode(data.toJson());

class TransactionDetailsModel {
  String? id;
  String? name;
  String? accountNumber;
  String? destinationAccountNumber;
  String? operation;
  int? amount;
  String? reference;
  DateTime? createdAt;

  TransactionDetailsModel({
    this.id,
    this.name,
    this.accountNumber,
    this.destinationAccountNumber,
    this.operation,
    this.amount,
    this.reference,
    this.createdAt,
  });

  factory TransactionDetailsModel.fromJson(Map<String, dynamic> json) =>
      TransactionDetailsModel(
        id: json["id"],
        name: json["name"],
        accountNumber: json["accountNumber"],
        destinationAccountNumber: json["destinationAccountNumber"],
        operation: json["operation"],
        amount: json["amount"],
        reference: json["reference"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "accountNumber": accountNumber,
        "destinationAccountNumber": destinationAccountNumber,
        "operation": operation,
        "amount": amount,
        "reference": reference,
        "createdAt": createdAt?.toIso8601String(),
      };
}
