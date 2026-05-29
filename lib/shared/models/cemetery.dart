import 'package:equatable/equatable.dart';

class Cemetery extends Equatable {
  const Cemetery({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.photoUrl,
    this.distanceKm,
    this.regionId,
    this.districtId,
    this.settlementId,
    this.regionName,
    this.districtName,
    this.settlementName,
    this.settlementType,
  });

  factory Cemetery.fromJson(Map<String, dynamic> json) {
    return Cemetery(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      description: (json['description'] as String?) ?? '',
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      photoUrl: (json['photo_url'] as String?) ?? '',
      distanceKm: json['distance_km'] != null
          ? (json['distance_km'] as num).toDouble()
          : null,
      regionId: json['region_id'] as String?,
      districtId: json['district_id'] as String?,
      settlementId: json['settlement_id'] as String?,
      regionName: json['region_name'] as String?,
      districtName: json['district_name'] as String?,
      settlementName: json['settlement_name'] as String?,
      settlementType: json['settlement_type'] as String?,
    );
  }

  final String id;
  final String name;
  final String location;
  final String description;
  final double latitude;
  final double longitude;
  final String photoUrl;
  final double? distanceKm;
  final String? regionId;
  final String? districtId;
  final String? settlementId;
  final String? regionName;
  final String? districtName;
  final String? settlementName;
  final String? settlementType;

  @override
  List<Object?> get props => [
        id,
        name,
        location,
        description,
        latitude,
        longitude,
        photoUrl,
        distanceKm,
        regionId,
        districtId,
        settlementId,
        regionName,
        districtName,
        settlementName,
        settlementType,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'photo_url': photoUrl,
      'distance_km': distanceKm,
      'region_id': regionId,
      'district_id': districtId,
      'settlement_id': settlementId,
      'region_name': regionName,
      'district_name': districtName,
      'settlement_name': settlementName,
      'settlement_type': settlementType,
    };
  }

  Cemetery copyWith({
    String? id,
    String? name,
    String? location,
    String? description,
    double? latitude,
    double? longitude,
    String? photoUrl,
    double? distanceKm,
    String? regionId,
    String? districtId,
    String? settlementId,
    String? regionName,
    String? districtName,
    String? settlementName,
    String? settlementType,
  }) {
    return Cemetery(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      description: description ?? this.description,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      photoUrl: photoUrl ?? this.photoUrl,
      distanceKm: distanceKm ?? this.distanceKm,
      regionId: regionId ?? this.regionId,
      districtId: districtId ?? this.districtId,
      settlementId: settlementId ?? this.settlementId,
      regionName: regionName ?? this.regionName,
      districtName: districtName ?? this.districtName,
      settlementName: settlementName ?? this.settlementName,
      settlementType: settlementType ?? this.settlementType,
    );
  }
}
