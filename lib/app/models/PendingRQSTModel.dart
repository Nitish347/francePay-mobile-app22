import 'dart:convert';

class PendingRequestsModel {
  String? id;
  String? payerId;
  String? receiverId;
  int? amount;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  PendingRequestsModel({
    this.id,
    this.payerId,
    this.receiverId,
    this.amount,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PendingRequestsModel.fromJson(Map<String, dynamic> json) =>
      PendingRequestsModel(
        id: json["_id"],
        payerId: json["payerId"],
        receiverId: json["receiverId"],
        amount: json["amount"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "payerId": payerId,
        "receiverId": receiverId,
        "amount": amount,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
