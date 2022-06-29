import 'dart:convert';

class ParcelHistory {
  String? parcelUuid;
  String? parcelStatus;
  ParcelHistory({
    this.parcelUuid,
    this.parcelStatus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'parcel_uuid': parcelUuid,
      'parcel_status': parcelStatus,
    };
  }

  factory ParcelHistory.fromMap(Map<String, dynamic> map) {
    return ParcelHistory(
      parcelUuid:
          map['parcel_uuid'] != null ? map['parcel_uuid'] as String : null,
      parcelStatus:
          map['parcel_status'] != null ? map['parcel_status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParcelHistory.fromJson(String source) =>
      ParcelHistory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ParcelShowcase(parcel_uuid: $parcelUuid, parcel_status: $parcelStatus)';
}
