import 'package:post_flow/domain/entities/user.dart';

// Modelo de User
class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressModel address;
  final String phone;
  final String website;
  final CompanyModel company;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: AddressModel.fromJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: CompanyModel.fromJson(json['company']),
    );
  }


  User toDomain() {
    return User(
      id: id,
      name: name,
      username: username,
      email: email,
      address: address.toDomain(),
      phone: phone,
      website: website,
      company: company.toDomain(),
    );
  }
}

// Modelo de Address
class AddressModel {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoModel geo;

  AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: GeoModel.fromJson(json['geo']),
    );
  }

  Address toDomain() {
    return Address(
      street: street,
      suite: suite,
      city: city,
      zipcode: zipcode,
      geo: geo.toDomain(),
    );
  }
}

// Modelo de Geo
class GeoModel {
  final double lat;
  final double lng;

  GeoModel({
    required this.lat,
    required this.lng,
  });

  // Convertir desde JSON
  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(
      lat: _parseToDouble(json['lat']),
      lng: _parseToDouble(json['lng']),
    );
  }

  static double _parseToDouble(dynamic value) {
    if (value is String) {
      return double.tryParse(value) ?? 0.0; 
    } else if (value is double) {
      return value;
    } else {
      return 0.0;
    }
  }

  Geo toDomain() {
    return Geo(
      lat: lat,
      lng: lng,
    );
  }
}

class CompanyModel {
  final String name;
  final String catchPhrase;
  final String bs;

  CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }

  Company toDomain() {
    return Company(
      name: name,
      catchPhrase: catchPhrase,
      bs: bs,
    );
  }
}
