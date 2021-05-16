import 'package:flutter/cupertino.dart';
import 'Utils.dart';

class AssetField {
  static const createdTime = 'createdTime';
}

class Asset {
  DateTime createdTime;
  String title;
  String id;
  String description;
  String givingDate;
  String receivingDate;
  String receiverID;
  String assetType;
  bool isAssigned;

  Asset({
    @required this.createdTime,
    @required this.title,
    this.description = '',
    this.id,
    this.givingDate,
    this.receivingDate,
    this.receiverID,
    this.assetType,
    this.isAssigned = false,
  });

  static Asset fromJson(Map<String, dynamic> json) => Asset(
        createdTime: Utils.toDateTime(json['createdTime']),
        title: json['title'],
        description: json['description'],
        id: json['id'],
        givingDate: json['givingDate'],
        receivingDate: json['receivingDate'],
        receiverID: json['receiverID'],
        assetType: json['assetType'],
        isAssigned: json['isAssigned'],
      );

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'title': title,
        'description': description,
        'id': id,
        'givingDate': givingDate,
        'receivingDate': receivingDate,
        'receiverID': receiverID,
        'assetType': assetType,
        'isAssigned': isAssigned,
      };
}
