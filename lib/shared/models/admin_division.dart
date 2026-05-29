import 'package:equatable/equatable.dart';

class Region extends Equatable {
  const Region({
    required this.id,
    required this.name,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  final String id;
  final String name;

  @override
  List<Object?> get props => [id, name];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class District extends Equatable {
  const District({
    required this.id,
    required this.regionId,
    required this.name,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['id'] as String,
      regionId: json['region_id'] as String,
      name: json['name'] as String,
    );
  }

  final String id;
  final String regionId;
  final String name;

  @override
  List<Object?> get props => [id, regionId, name];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'region_id': regionId,
      'name': name,
    };
  }
}

class Settlement extends Equatable {
  const Settlement({
    required this.id,
    required this.districtId,
    required this.name,
    required this.type,
  });

  factory Settlement.fromJson(Map<String, dynamic> json) {
    return Settlement(
      id: json['id'] as String,
      districtId: json['district_id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
    );
  }

  final String id;
  final String districtId;
  final String name;
  final String type; // 'місто', 'смт', 'село', 'селище'

  @override
  List<Object?> get props => [id, districtId, name, type];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'district_id': districtId,
      'name': name,
      'type': type,
    };
  }
}
