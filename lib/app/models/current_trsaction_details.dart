import 'dart:convert';

class CurrentTrasactionDetails {
  bool? status;
  String? msg;
  Transaction? transaction;
  Customer? customer;

  CurrentTrasactionDetails({
    this.status,
    this.msg,
    this.transaction,
    this.customer,
  });

  factory CurrentTrasactionDetails.fromJson(Map<String, dynamic> json) =>
      CurrentTrasactionDetails(
        status: json["status"],
        msg: json["msg"],
        transaction: json["transaction"] == null
            ? null
            : Transaction.fromJson(json["transaction"]),
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "transaction": transaction?.toJson(),
        "customer": customer?.toJson(),
      };
}

class Customer {
  String? id;
  String? walletId;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  int? balance;
  DateTime? createdOn;

  Customer({
    this.id,
    this.walletId,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.balance,
    this.createdOn,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        walletId: json["wallet_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        balance: json["balance"],
        createdOn: json["createdOn"] == null
            ? null
            : DateTime.parse(json["createdOn"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "wallet_id": walletId,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "balance": balance,
        "createdOn": createdOn?.toIso8601String(),
      };
}

class Transaction {
  String? id;
  String? accountNumber;
  String? destinationAccountNumber;
  String? operation;
  int? amount;
  String? reference;
  DateTime? createdAt;

  Transaction({
    this.id,
    this.accountNumber,
    this.destinationAccountNumber,
    this.operation,
    this.amount,
    this.reference,
    this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
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
