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
    };
  }
}
