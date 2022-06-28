// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ParcelShowcase {
  String? parcelNum;
  String? parcelName;
  String? sender;
  String? senderUuid;
  String? receiver;
  String? receiverUuid;
  ParcelShowcase({
    this.parcelNum,
    this.parcelName,
    this.sender,
    this.senderUuid,
    this.receiver,
    this.receiverUuid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'parcelNum': parcelNum,
      'parcelName': parcelName,
      'sender': sender,
      'senderUuid': senderUuid,
      'receiver': receiver,
      'receiverUuid': receiverUuid,
    };
  }

  factory ParcelShowcase.fromMap(Map<String, dynamic> map) {
    return ParcelShowcase(
      parcelNum: map['parcel_num'] != null ? map['parcel_num'] as String : null,
      parcelName:
          map['parcel_name'] != null ? map['parcel_name'] as String : null,
      sender: map['sender'] != null ? map['sender'] as String : null,
      senderUuid:
          map['sender_uuid'] != null ? map['sender_uuid'] as String : null,
      receiver: map['receiver'] != null ? map['receiver'] as String : null,
      receiverUuid:
          map['receiver_uuid'] != null ? map['receiver_uuid'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParcelShowcase.fromJson(String source) =>
      ParcelShowcase.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserShowcase(parcelNum: $parcelNum, parcelName: $parcelName, sender: $sender, senderUuid: $senderUuid, receiver: $receiver, receiverUuid: $receiverUuid)';
  }
}
