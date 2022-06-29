import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostMachine {
  int? id;
  String? city;
  String? zipcode;
  String? street;
  String? buldingNum;
  String? localNum;
  int? number;
  int? available;
  String? boxType;
  PostMachine({
    this.id,
    this.city,
    this.zipcode,
    this.street,
    this.buldingNum,
    this.localNum,
    this.number,
    this.available,
    this.boxType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pmId': id,
      'pmCity': city,
      'pmZipcode': zipcode,
      'pmStret': street,
      'pmBuldingnum': buldingNum,
      'pmLocalnum': localNum,
      'number': number,
      'available': available,
      'boxType': boxType,
    };
  }

  factory PostMachine.fromMap(Map<String, dynamic> map) {
    return PostMachine(
      id: map['pm_id'] != null ? map['pm_id'] as int : null,
      city: map['pm_city'] != null ? map['pm_city'] as String : null,
      zipcode: map['pm_zipcode'] != null ? map['pm_zipcode'] as String : null,
      street: map['pm_street'] != null ? map['pm_street'] as String : null,
      buldingNum:
          map['pm_buldingnum'] != null ? map['pm_buldingnum'] as String : null,
      localNum:
          map['pm_localnum'] != null ? map['pm_localnum'] as String : null,
      number: map['number'] != null ? map['number'] as int : null,
      available: map['available'] != null ? map['available'] as int : null,
      boxType: map['box_type'] != null ? map['box_type'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostMachine.fromJson(String source) =>
      PostMachine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '${city!.trim()} ${zipcode!.trim()}, ${street!.trim()} ${buldingNum!.trim()}';
  }
}
