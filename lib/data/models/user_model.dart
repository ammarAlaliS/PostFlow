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

  // Convertir desde JSON
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

  // Conversión de UserModel a User (para la capa de dominio)
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

  // Convertir desde JSON
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: GeoModel.fromJson(json['geo']),
    );
  }

  // Conversión de AddressModel a Address (para la capa de dominio)
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

  // Helper para parsear de String a double si es necesario
  static double _parseToDouble(dynamic value) {
    if (value is String) {
      // Si el valor es un String, intentamos parsearlo a un double
      return double.tryParse(value) ?? 0.0; // Retorna 0.0 si no es un número válido
    } else if (value is double) {
      // Si el valor ya es un double, simplemente lo devolvemos
      return value;
    } else {
      // Si el valor no es ni String ni double, retornamos 0.0
      return 0.0;
    }
  }

  // Conversión de GeoModel a Geo (para la capa de dominio)
  Geo toDomain() {
    return Geo(
      lat: lat,
      lng: lng,
    );
  }
}

// Modelo de Company
class CompanyModel {
  final String name;
  final String catchPhrase;
  final String bs;

  CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  // Convertir desde JSON
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }

  // Conversión de CompanyModel a Company (para la capa de dominio)
  Company toDomain() {
    return Company(
      name: name,
      catchPhrase: catchPhrase,
      bs: bs,
    );
  }
}
