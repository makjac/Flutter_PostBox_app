// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ParcelDestination {
  String? parcelUuid;
  String? pmStreet;
  String? pmBuldingnum;
  String? pmZipcode;
  String? pmCity;
  ParcelDestination({
    this.parcelUuid,
    this.pmStreet,
    this.pmBuldingnum,
    this.pmZipcode,
    this.pmCity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'parcel_uuid': parcelUuid,
      'pm_street': pmStreet,
      'pm_buldingnum': pmBuldingnum,
      'pm_zipcode': pmZipcode,
      'pm_city': pmCity,
    };
  }

  factory ParcelDestination.fromMap(Map<String, dynamic> map) {
    return ParcelDestination(
      parcelUuid:
          map['parcel_uuid'] != null ? map['parcel_uuid'] as String : null,
      pmStreet: map['pm_street'] != null ? map['pm_street'] as String : null,
      pmBuldingnum:
          map['pm_buldingnum'] != null ? map['pm_buldingnum'] as String : null,
      pmZipcode: map['pm_zipcode'] != null ? map['pm_zipcode'] as String : null,
      pmCity: map['pm_city'] != null ? map['pm_city'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParcelDestination.fromJson(String source) =>
      ParcelDestination.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ParcelDestination(parcel_uuid: $parcelUuid, pm_street: $pmStreet, pm_buldingnum: $pmBuldingnum, pm_zipcode: $pmZipcode, pm_city: $pmCity)';
  }
}
