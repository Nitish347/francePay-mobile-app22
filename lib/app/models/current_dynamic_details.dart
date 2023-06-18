// To parse this JSON data, do
//
//     final currentDynamicDetails = currentDynamicDetailsFromJson(jsonString);

import 'dart:convert';

class CurrentDynamicDetails {
  String? id;
  String? accountNumber;
  String? destinationAccountNumber;
  String? operation;
  int? amount;
  String? reference;
  DateTime? createdAt;

  CurrentDynamicDetails({
    this.id,
    this.accountNumber,
    this.destinationAccountNumber,
    this.operation,
    this.amount,
    this.reference,
    this.createdAt,
  });

  factory CurrentDynamicDetails.fromJson(Map<String, dynamic> json) =>
      CurrentDynamicDetails(
        id: json["id"],
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
        "accountNumber": accountNumber,
        "destinationAccountNumber": destinationAccountNumber,
        "operation": operation,
        "amount": amount,
        "reference": reference,
        "createdAt": createdAt?.toIso8601String(),
      };
}
