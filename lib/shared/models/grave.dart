import 'package:equatable/equatable.dart';

class Grave extends Equatable {
  const Grave({
    required this.id,
    required this.cemeteryId,
    required this.name,
    required this.birthDate,
    required this.deathDate,
    required this.latitude,
    required this.longitude,
    required this.bio,
    required this.photoUrl,
  });

  factory Grave.fromJson(Map<String, dynamic> json) {
    return Grave(
      id: json['id'] as String,
      cemeteryId: json['cemetery_id'] as String,
      name: json['name'] as String,
      birthDate: json['birth_date'] as String,
      deathDate: json['death_date'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      bio: (json['bio'] as String?) ?? '',
      photoUrl: (json['photo_url'] as String?) ?? '',
    );
  }

  final String id;
  final String cemeteryId;
  final String name;
  final String birthDate; // e.g. "1945-05-12" or "1945"
  final String deathDate; // e.g. "2020-11-03"
  final double latitude;
  final double longitude;
  final String bio;
  final String photoUrl;

  @override
  List<Object?> get props => [
        id,
        cemeteryId,
        name,
        birthDate,
        deathDate,
        latitude,
        longitude,
        bio,
        photoUrl,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cemetery_id': cemeteryId,
      'name': name,
      'birth_date': birthDate,
      'death_date': deathDate,
      'latitude': latitude,
      'longitude': longitude,
      'bio': bio,
      'photo_url': photoUrl,
    };
  }

  Grave copyWith({
    String? id,
    String? cemeteryId,
    String? name,
    String? birthDate,
    String? deathDate,
    double? latitude,
    double? longitude,
    String? bio,
    String? photoUrl,
  }) {
    return Grave(
      id: id ?? this.id,
      cemeteryId: cemeteryId ?? this.cemeteryId,
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      deathDate: deathDate ?? this.deathDate,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      bio: bio ?? this.bio,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}
