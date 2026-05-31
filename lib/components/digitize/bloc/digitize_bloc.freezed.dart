// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'digitize_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DigitizeEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DigitizeEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DigitizeEvent()';
  }
}

/// @nodoc
class $DigitizeEventCopyWith<$Res> {
  $DigitizeEventCopyWith(DigitizeEvent _, $Res Function(DigitizeEvent) __);
}

/// Adds pattern-matching-related methods to [DigitizeEvent].
extension DigitizeEventPatterns on DigitizeEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadRegions value)? loadRegions,
    TResult Function(_RegionChanged value)? regionChanged,
    TResult Function(_DistrictChanged value)? districtChanged,
    TResult Function(_SettlementChanged value)? settlementChanged,
    TResult Function(_CreateCemetery value)? createCemetery,
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_BirthDateChanged value)? birthDateChanged,
    TResult Function(_DeathDateChanged value)? deathDateChanged,
    TResult Function(_BioChanged value)? bioChanged,
    TResult Function(_CemeterySelected value)? cemeterySelected,
    TResult Function(_GetCurrentGps value)? getCurrentGps,
    TResult Function(_SubmitGrave value)? submitGrave,
    TResult Function(_RecognizeTextFromImage value)? recognizeTextFromImage,
    TResult Function(_PickImageAndRecognize value)? pickImageAndRecognize,
    TResult Function(_ResetForm value)? resetForm,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadRegions() when loadRegions != null:
        return loadRegions(_that);
      case _RegionChanged() when regionChanged != null:
        return regionChanged(_that);
      case _DistrictChanged() when districtChanged != null:
        return districtChanged(_that);
      case _SettlementChanged() when settlementChanged != null:
        return settlementChanged(_that);
      case _CreateCemetery() when createCemetery != null:
        return createCemetery(_that);
      case _FullNameChanged() when fullNameChanged != null:
        return fullNameChanged(_that);
      case _BirthDateChanged() when birthDateChanged != null:
        return birthDateChanged(_that);
      case _DeathDateChanged() when deathDateChanged != null:
        return deathDateChanged(_that);
      case _BioChanged() when bioChanged != null:
        return bioChanged(_that);
      case _CemeterySelected() when cemeterySelected != null:
        return cemeterySelected(_that);
      case _GetCurrentGps() when getCurrentGps != null:
        return getCurrentGps(_that);
      case _SubmitGrave() when submitGrave != null:
        return submitGrave(_that);
      case _RecognizeTextFromImage() when recognizeTextFromImage != null:
        return recognizeTextFromImage(_that);
      case _PickImageAndRecognize() when pickImageAndRecognize != null:
        return pickImageAndRecognize(_that);
      case _ResetForm() when resetForm != null:
        return resetForm(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadRegions value) loadRegions,
    required TResult Function(_RegionChanged value) regionChanged,
    required TResult Function(_DistrictChanged value) districtChanged,
    required TResult Function(_SettlementChanged value) settlementChanged,
    required TResult Function(_CreateCemetery value) createCemetery,
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_BirthDateChanged value) birthDateChanged,
    required TResult Function(_DeathDateChanged value) deathDateChanged,
    required TResult Function(_BioChanged value) bioChanged,
    required TResult Function(_CemeterySelected value) cemeterySelected,
    required TResult Function(_GetCurrentGps value) getCurrentGps,
    required TResult Function(_SubmitGrave value) submitGrave,
    required TResult Function(_RecognizeTextFromImage value)
        recognizeTextFromImage,
    required TResult Function(_PickImageAndRecognize value)
        pickImageAndRecognize,
    required TResult Function(_ResetForm value) resetForm,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadRegions():
        return loadRegions(_that);
      case _RegionChanged():
        return regionChanged(_that);
      case _DistrictChanged():
        return districtChanged(_that);
      case _SettlementChanged():
        return settlementChanged(_that);
      case _CreateCemetery():
        return createCemetery(_that);
      case _FullNameChanged():
        return fullNameChanged(_that);
      case _BirthDateChanged():
        return birthDateChanged(_that);
      case _DeathDateChanged():
        return deathDateChanged(_that);
      case _BioChanged():
        return bioChanged(_that);
      case _CemeterySelected():
        return cemeterySelected(_that);
      case _GetCurrentGps():
        return getCurrentGps(_that);
      case _SubmitGrave():
        return submitGrave(_that);
      case _RecognizeTextFromImage():
        return recognizeTextFromImage(_that);
      case _PickImageAndRecognize():
        return pickImageAndRecognize(_that);
      case _ResetForm():
        return resetForm(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadRegions value)? loadRegions,
    TResult? Function(_RegionChanged value)? regionChanged,
    TResult? Function(_DistrictChanged value)? districtChanged,
    TResult? Function(_SettlementChanged value)? settlementChanged,
    TResult? Function(_CreateCemetery value)? createCemetery,
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_BirthDateChanged value)? birthDateChanged,
    TResult? Function(_DeathDateChanged value)? deathDateChanged,
    TResult? Function(_BioChanged value)? bioChanged,
    TResult? Function(_CemeterySelected value)? cemeterySelected,
    TResult? Function(_GetCurrentGps value)? getCurrentGps,
    TResult? Function(_SubmitGrave value)? submitGrave,
    TResult? Function(_RecognizeTextFromImage value)? recognizeTextFromImage,
    TResult? Function(_PickImageAndRecognize value)? pickImageAndRecognize,
    TResult? Function(_ResetForm value)? resetForm,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadRegions() when loadRegions != null:
        return loadRegions(_that);
      case _RegionChanged() when regionChanged != null:
        return regionChanged(_that);
      case _DistrictChanged() when districtChanged != null:
        return districtChanged(_that);
      case _SettlementChanged() when settlementChanged != null:
        return settlementChanged(_that);
      case _CreateCemetery() when createCemetery != null:
        return createCemetery(_that);
      case _FullNameChanged() when fullNameChanged != null:
        return fullNameChanged(_that);
      case _BirthDateChanged() when birthDateChanged != null:
        return birthDateChanged(_that);
      case _DeathDateChanged() when deathDateChanged != null:
        return deathDateChanged(_that);
      case _BioChanged() when bioChanged != null:
        return bioChanged(_that);
      case _CemeterySelected() when cemeterySelected != null:
        return cemeterySelected(_that);
      case _GetCurrentGps() when getCurrentGps != null:
        return getCurrentGps(_that);
      case _SubmitGrave() when submitGrave != null:
        return submitGrave(_that);
      case _RecognizeTextFromImage() when recognizeTextFromImage != null:
        return recognizeTextFromImage(_that);
      case _PickImageAndRecognize() when pickImageAndRecognize != null:
        return pickImageAndRecognize(_that);
      case _ResetForm() when resetForm != null:
        return resetForm(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRegions,
    TResult Function(Region? region)? regionChanged,
    TResult Function(District? district)? districtChanged,
    TResult Function(Settlement? settlement)? settlementChanged,
    TResult Function(String name, String location, String description,
            double latitude, double longitude, String? photoUrl)?
        createCemetery,
    TResult Function(String value)? fullNameChanged,
    TResult Function(String value)? birthDateChanged,
    TResult Function(String value)? deathDateChanged,
    TResult Function(String value)? bioChanged,
    TResult Function(Cemetery? value)? cemeterySelected,
    TResult Function()? getCurrentGps,
    TResult Function()? submitGrave,
    TResult Function(String imagePath)? recognizeTextFromImage,
    TResult Function()? pickImageAndRecognize,
    TResult Function()? resetForm,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadRegions() when loadRegions != null:
        return loadRegions();
      case _RegionChanged() when regionChanged != null:
        return regionChanged(_that.region);
      case _DistrictChanged() when districtChanged != null:
        return districtChanged(_that.district);
      case _SettlementChanged() when settlementChanged != null:
        return settlementChanged(_that.settlement);
      case _CreateCemetery() when createCemetery != null:
        return createCemetery(_that.name, _that.location, _that.description,
            _that.latitude, _that.longitude, _that.photoUrl);
      case _FullNameChanged() when fullNameChanged != null:
        return fullNameChanged(_that.value);
      case _BirthDateChanged() when birthDateChanged != null:
        return birthDateChanged(_that.value);
      case _DeathDateChanged() when deathDateChanged != null:
        return deathDateChanged(_that.value);
      case _BioChanged() when bioChanged != null:
        return bioChanged(_that.value);
      case _CemeterySelected() when cemeterySelected != null:
        return cemeterySelected(_that.value);
      case _GetCurrentGps() when getCurrentGps != null:
        return getCurrentGps();
      case _SubmitGrave() when submitGrave != null:
        return submitGrave();
      case _RecognizeTextFromImage() when recognizeTextFromImage != null:
        return recognizeTextFromImage(_that.imagePath);
      case _PickImageAndRecognize() when pickImageAndRecognize != null:
        return pickImageAndRecognize();
      case _ResetForm() when resetForm != null:
        return resetForm();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRegions,
    required TResult Function(Region? region) regionChanged,
    required TResult Function(District? district) districtChanged,
    required TResult Function(Settlement? settlement) settlementChanged,
    required TResult Function(String name, String location, String description,
            double latitude, double longitude, String? photoUrl)
        createCemetery,
    required TResult Function(String value) fullNameChanged,
    required TResult Function(String value) birthDateChanged,
    required TResult Function(String value) deathDateChanged,
    required TResult Function(String value) bioChanged,
    required TResult Function(Cemetery? value) cemeterySelected,
    required TResult Function() getCurrentGps,
    required TResult Function() submitGrave,
    required TResult Function(String imagePath) recognizeTextFromImage,
    required TResult Function() pickImageAndRecognize,
    required TResult Function() resetForm,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadRegions():
        return loadRegions();
      case _RegionChanged():
        return regionChanged(_that.region);
      case _DistrictChanged():
        return districtChanged(_that.district);
      case _SettlementChanged():
        return settlementChanged(_that.settlement);
      case _CreateCemetery():
        return createCemetery(_that.name, _that.location, _that.description,
            _that.latitude, _that.longitude, _that.photoUrl);
      case _FullNameChanged():
        return fullNameChanged(_that.value);
      case _BirthDateChanged():
        return birthDateChanged(_that.value);
      case _DeathDateChanged():
        return deathDateChanged(_that.value);
      case _BioChanged():
        return bioChanged(_that.value);
      case _CemeterySelected():
        return cemeterySelected(_that.value);
      case _GetCurrentGps():
        return getCurrentGps();
      case _SubmitGrave():
        return submitGrave();
      case _RecognizeTextFromImage():
        return recognizeTextFromImage(_that.imagePath);
      case _PickImageAndRecognize():
        return pickImageAndRecognize();
      case _ResetForm():
        return resetForm();
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRegions,
    TResult? Function(Region? region)? regionChanged,
    TResult? Function(District? district)? districtChanged,
    TResult? Function(Settlement? settlement)? settlementChanged,
    TResult? Function(String name, String location, String description,
            double latitude, double longitude, String? photoUrl)?
        createCemetery,
    TResult? Function(String value)? fullNameChanged,
    TResult? Function(String value)? birthDateChanged,
    TResult? Function(String value)? deathDateChanged,
    TResult? Function(String value)? bioChanged,
    TResult? Function(Cemetery? value)? cemeterySelected,
    TResult? Function()? getCurrentGps,
    TResult? Function()? submitGrave,
    TResult? Function(String imagePath)? recognizeTextFromImage,
    TResult? Function()? pickImageAndRecognize,
    TResult? Function()? resetForm,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadRegions() when loadRegions != null:
        return loadRegions();
      case _RegionChanged() when regionChanged != null:
        return regionChanged(_that.region);
      case _DistrictChanged() when districtChanged != null:
        return districtChanged(_that.district);
      case _SettlementChanged() when settlementChanged != null:
        return settlementChanged(_that.settlement);
      case _CreateCemetery() when createCemetery != null:
        return createCemetery(_that.name, _that.location, _that.description,
            _that.latitude, _that.longitude, _that.photoUrl);
      case _FullNameChanged() when fullNameChanged != null:
        return fullNameChanged(_that.value);
      case _BirthDateChanged() when birthDateChanged != null:
        return birthDateChanged(_that.value);
      case _DeathDateChanged() when deathDateChanged != null:
        return deathDateChanged(_that.value);
      case _BioChanged() when bioChanged != null:
        return bioChanged(_that.value);
      case _CemeterySelected() when cemeterySelected != null:
        return cemeterySelected(_that.value);
      case _GetCurrentGps() when getCurrentGps != null:
        return getCurrentGps();
      case _SubmitGrave() when submitGrave != null:
        return submitGrave();
      case _RecognizeTextFromImage() when recognizeTextFromImage != null:
        return recognizeTextFromImage(_that.imagePath);
      case _PickImageAndRecognize() when pickImageAndRecognize != null:
        return pickImageAndRecognize();
      case _ResetForm() when resetForm != null:
        return resetForm();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadRegions implements DigitizeEvent {
  const _LoadRegions();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadRegions);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DigitizeEvent.loadRegions()';
  }
}

/// @nodoc

class _RegionChanged implements DigitizeEvent {
  const _RegionChanged(this.region);

  final Region? region;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegionChangedCopyWith<_RegionChanged> get copyWith =>
      __$RegionChangedCopyWithImpl<_RegionChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegionChanged &&
            (identical(other.region, region) || other.region == region));
  }

  @override
  int get hashCode => Object.hash(runtimeType, region);

  @override
  String toString() {
    return 'DigitizeEvent.regionChanged(region: $region)';
  }
}

/// @nodoc
abstract mixin class _$RegionChangedCopyWith<$Res>
    implements $DigitizeEventCopyWith<$Res> {
  factory _$RegionChangedCopyWith(
          _RegionChanged value, $Res Function(_RegionChanged) _then) =
      __$RegionChangedCopyWithImpl;
  @useResult
  $Res call({Region? region});
}

/// @nodoc
class __$RegionChangedCopyWithImpl<$Res>
    implements _$RegionChangedCopyWith<$Res> {
  __$RegionChangedCopyWithImpl(this._self, this._then);

  final _RegionChanged _self;
  final $Res Function(_RegionChanged) _then;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? region = freezed,
  }) {
    return _then(_RegionChanged(
      freezed == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as Region?,
    ));
  }
}

/// @nodoc

class _DistrictChanged implements DigitizeEvent {
  const _DistrictChanged(this.district);

  final District? district;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DistrictChangedCopyWith<_DistrictChanged> get copyWith =>
      __$DistrictChangedCopyWithImpl<_DistrictChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DistrictChanged &&
            (identical(other.district, district) ||
                other.district == district));
  }

  @override
  int get hashCode => Object.hash(runtimeType, district);

  @override
  String toString() {
    return 'DigitizeEvent.districtChanged(district: $district)';
  }
}

/// @nodoc
abstract mixin class _$DistrictChangedCopyWith<$Res>
    implements $DigitizeEventCopyWith<$Res> {
  factory _$DistrictChangedCopyWith(
          _DistrictChanged value, $Res Function(_DistrictChanged) _then) =
      __$DistrictChangedCopyWithImpl;
  @useResult
  $Res call({District? district});
}

/// @nodoc
class __$DistrictChangedCopyWithImpl<$Res>
    implements _$DistrictChangedCopyWith<$Res> {
  __$DistrictChangedCopyWithImpl(this._self, this._then);

  final _DistrictChanged _self;
  final $Res Function(_DistrictChanged) _then;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? district = freezed,
  }) {
    return _then(_DistrictChanged(
      freezed == district
          ? _self.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
    ));
  }
}

/// @nodoc

class _SettlementChanged implements DigitizeEvent {
  const _SettlementChanged(this.settlement);

  final Settlement? settlement;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SettlementChangedCopyWith<_SettlementChanged> get copyWith =>
      __$SettlementChangedCopyWithImpl<_SettlementChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettlementChanged &&
            (identical(other.settlement, settlement) ||
                other.settlement == settlement));
  }

  @override
  int get hashCode => Object.hash(runtimeType, settlement);

  @override
  String toString() {
    return 'DigitizeEvent.settlementChanged(settlement: $settlement)';
  }
}

/// @nodoc
abstract mixin class _$SettlementChangedCopyWith<$Res>
    implements $DigitizeEventCopyWith<$Res> {
  factory _$SettlementChangedCopyWith(
          _SettlementChanged value, $Res Function(_SettlementChanged) _then) =
      __$SettlementChangedCopyWithImpl;
  @useResult
  $Res call({Settlement? settlement});
}

/// @nodoc
class __$SettlementChangedCopyWithImpl<$Res>
    implements _$SettlementChangedCopyWith<$Res> {
  __$SettlementChangedCopyWithImpl(this._self, this._then);

  final _SettlementChanged _self;
  final $Res Function(_SettlementChanged) _then;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? settlement = freezed,
  }) {
    return _then(_SettlementChanged(
      freezed == settlement
          ? _self.settlement
          : settlement // ignore: cast_nullable_to_non_nullable
              as Settlement?,
    ));
  }
}

/// @nodoc

class _CreateCemetery implements DigitizeEvent {
  const _CreateCemetery(
      {required this.name,
      required this.location,
      required this.description,
      required this.latitude,
      required this.longitude,
      this.photoUrl});

  final String name;
  final String location;
  final String description;
  final double latitude;
  final double longitude;
  final String? photoUrl;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateCemeteryCopyWith<_CreateCemetery> get copyWith =>
      __$CreateCemeteryCopyWithImpl<_CreateCemetery>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateCemetery &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, location, description, latitude, longitude, photoUrl);

  @override
  String toString() {
    return 'DigitizeEvent.createCemetery(name: $name, location: $location, description: $description, latitude: $latitude, longitude: $longitude, photoUrl: $photoUrl)';
  }
}

/// @nodoc
abstract mixin class _$CreateCemeteryCopyWith<$Res>
    implements $DigitizeEventCopyWith<$Res> {
  factory _$CreateCemeteryCopyWith(
          _CreateCemetery value, $Res Function(_CreateCemetery) _then) =
      __$CreateCemeteryCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String location,
      String description,
      double latitude,
      double longitude,
      String? photoUrl});
}

/// @nodoc
class __$CreateCemeteryCopyWithImpl<$Res>
    implements _$CreateCemeteryCopyWith<$Res> {
  __$CreateCemeteryCopyWithImpl(this._self, this._then);

  final _CreateCemetery _self;
  final $Res Function(_CreateCemetery) _then;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? location = null,
    Object? description = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? photoUrl = freezed,
  }) {
    return _then(_CreateCemetery(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _FullNameChanged implements DigitizeEvent {
  const _FullNameChanged(this.value);

  final String value;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FullNameChangedCopyWith<_FullNameChanged> get copyWith =>
      __$FullNameChangedCopyWithImpl<_FullNameChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FullNameChanged &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'DigitizeEvent.fullNameChanged(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$FullNameChangedCopyWith<$Res>
    implements $DigitizeEventCopyWith<$Res> {
  factory _$FullNameChangedCopyWith(
          _FullNameChanged value, $Res Function(_FullNameChanged) _then) =
      __$FullNameChangedCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$FullNameChangedCopyWithImpl<$Res>
    implements _$FullNameChangedCopyWith<$Res> {
  __$FullNameChangedCopyWithImpl(this._self, this._then);

  final _FullNameChanged _self;
  final $Res Function(_FullNameChanged) _then;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(_FullNameChanged(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _BirthDateChanged implements DigitizeEvent {
  const _BirthDateChanged(this.value);

  final String value;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BirthDateChangedCopyWith<_BirthDateChanged> get copyWith =>
      __$BirthDateChangedCopyWithImpl<_BirthDateChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BirthDateChanged &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'DigitizeEvent.birthDateChanged(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$BirthDateChangedCopyWith<$Res>
    implements $DigitizeEventCopyWith<$Res> {
  factory _$BirthDateChangedCopyWith(
          _BirthDateChanged value, $Res Function(_BirthDateChanged) _then) =
      __$BirthDateChangedCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$BirthDateChangedCopyWithImpl<$Res>
    implements _$BirthDateChangedCopyWith<$Res> {
  __$BirthDateChangedCopyWithImpl(this._self, this._then);

  final _BirthDateChanged _self;
  final $Res Function(_BirthDateChanged) _then;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(_BirthDateChanged(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _DeathDateChanged implements DigitizeEvent {
  const _DeathDateChanged(this.value);

  final String value;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeathDateChangedCopyWith<_DeathDateChanged> get copyWith =>
      __$DeathDateChangedCopyWithImpl<_DeathDateChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeathDateChanged &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'DigitizeEvent.deathDateChanged(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$DeathDateChangedCopyWith<$Res>
    implements $DigitizeEventCopyWith<$Res> {
  factory _$DeathDateChangedCopyWith(
          _DeathDateChanged value, $Res Function(_DeathDateChanged) _then) =
      __$DeathDateChangedCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$DeathDateChangedCopyWithImpl<$Res>
    implements _$DeathDateChangedCopyWith<$Res> {
  __$DeathDateChangedCopyWithImpl(this._self, this._then);

  final _DeathDateChanged _self;
  final $Res Function(_DeathDateChanged) _then;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(_DeathDateChanged(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _BioChanged implements DigitizeEvent {
  const _BioChanged(this.value);

  final String value;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BioChangedCopyWith<_BioChanged> get copyWith =>
      __$BioChangedCopyWithImpl<_BioChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BioChanged &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'DigitizeEvent.bioChanged(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$BioChangedCopyWith<$Res>
    implements $DigitizeEventCopyWith<$Res> {
  factory _$BioChangedCopyWith(
          _BioChanged value, $Res Function(_BioChanged) _then) =
      __$BioChangedCopyWithImpl;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$BioChangedCopyWithImpl<$Res> implements _$BioChangedCopyWith<$Res> {
  __$BioChangedCopyWithImpl(this._self, this._then);

  final _BioChanged _self;
  final $Res Function(_BioChanged) _then;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(_BioChanged(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _CemeterySelected implements DigitizeEvent {
  const _CemeterySelected(this.value);

  final Cemetery? value;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CemeterySelectedCopyWith<_CemeterySelected> get copyWith =>
      __$CemeterySelectedCopyWithImpl<_CemeterySelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CemeterySelected &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'DigitizeEvent.cemeterySelected(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$CemeterySelectedCopyWith<$Res>
    implements $DigitizeEventCopyWith<$Res> {
  factory _$CemeterySelectedCopyWith(
          _CemeterySelected value, $Res Function(_CemeterySelected) _then) =
      __$CemeterySelectedCopyWithImpl;
  @useResult
  $Res call({Cemetery? value});
}

/// @nodoc
class __$CemeterySelectedCopyWithImpl<$Res>
    implements _$CemeterySelectedCopyWith<$Res> {
  __$CemeterySelectedCopyWithImpl(this._self, this._then);

  final _CemeterySelected _self;
  final $Res Function(_CemeterySelected) _then;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_CemeterySelected(
      freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as Cemetery?,
    ));
  }
}

/// @nodoc

class _GetCurrentGps implements DigitizeEvent {
  const _GetCurrentGps();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetCurrentGps);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DigitizeEvent.getCurrentGps()';
  }
}

/// @nodoc

class _SubmitGrave implements DigitizeEvent {
  const _SubmitGrave();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SubmitGrave);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DigitizeEvent.submitGrave()';
  }
}

/// @nodoc

class _RecognizeTextFromImage implements DigitizeEvent {
  const _RecognizeTextFromImage(this.imagePath);

  final String imagePath;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecognizeTextFromImageCopyWith<_RecognizeTextFromImage> get copyWith =>
      __$RecognizeTextFromImageCopyWithImpl<_RecognizeTextFromImage>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecognizeTextFromImage &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagePath);

  @override
  String toString() {
    return 'DigitizeEvent.recognizeTextFromImage(imagePath: $imagePath)';
  }
}

/// @nodoc
abstract mixin class _$RecognizeTextFromImageCopyWith<$Res>
    implements $DigitizeEventCopyWith<$Res> {
  factory _$RecognizeTextFromImageCopyWith(_RecognizeTextFromImage value,
          $Res Function(_RecognizeTextFromImage) _then) =
      __$RecognizeTextFromImageCopyWithImpl;
  @useResult
  $Res call({String imagePath});
}

/// @nodoc
class __$RecognizeTextFromImageCopyWithImpl<$Res>
    implements _$RecognizeTextFromImageCopyWith<$Res> {
  __$RecognizeTextFromImageCopyWithImpl(this._self, this._then);

  final _RecognizeTextFromImage _self;
  final $Res Function(_RecognizeTextFromImage) _then;

  /// Create a copy of DigitizeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imagePath = null,
  }) {
    return _then(_RecognizeTextFromImage(
      null == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _PickImageAndRecognize implements DigitizeEvent {
  const _PickImageAndRecognize();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PickImageAndRecognize);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DigitizeEvent.pickImageAndRecognize()';
  }
}

/// @nodoc

class _ResetForm implements DigitizeEvent {
  const _ResetForm();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ResetForm);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DigitizeEvent.resetForm()';
  }
}

/// @nodoc
mixin _$DigitizeState {
  LoadingStatus get status;
  LoadingStatus get adminDataStatus;
  LoadingStatus get cemeteryCreationStatus;
  List<Region> get regions;
  List<District> get districts;
  List<Settlement> get settlements;
  List<Cemetery> get cemeteries;
  Region? get selectedRegion;
  District? get selectedDistrict;
  Settlement? get selectedSettlement;
  GpsStatus get gpsStatus;
  OcrStatus get ocrStatus;
  String get fullName;
  String get birthDate;
  String get deathDate;
  String get bio;
  String? get photoPath;
  String? get photoUrl;
  Cemetery? get selectedCemetery;
  double? get latitude;
  double? get longitude;
  bool get showErrors;
  String? get errorMessage;
  String? get cemeteryErrorMessage;

  /// Create a copy of DigitizeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DigitizeStateCopyWith<DigitizeState> get copyWith =>
      _$DigitizeStateCopyWithImpl<DigitizeState>(
          this as DigitizeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DigitizeState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.adminDataStatus, adminDataStatus) ||
                other.adminDataStatus == adminDataStatus) &&
            (identical(other.cemeteryCreationStatus, cemeteryCreationStatus) ||
                other.cemeteryCreationStatus == cemeteryCreationStatus) &&
            const DeepCollectionEquality().equals(other.regions, regions) &&
            const DeepCollectionEquality().equals(other.districts, districts) &&
            const DeepCollectionEquality()
                .equals(other.settlements, settlements) &&
            const DeepCollectionEquality()
                .equals(other.cemeteries, cemeteries) &&
            (identical(other.selectedRegion, selectedRegion) ||
                other.selectedRegion == selectedRegion) &&
            (identical(other.selectedDistrict, selectedDistrict) ||
                other.selectedDistrict == selectedDistrict) &&
            (identical(other.selectedSettlement, selectedSettlement) ||
                other.selectedSettlement == selectedSettlement) &&
            (identical(other.gpsStatus, gpsStatus) ||
                other.gpsStatus == gpsStatus) &&
            (identical(other.ocrStatus, ocrStatus) ||
                other.ocrStatus == ocrStatus) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.deathDate, deathDate) ||
                other.deathDate == deathDate) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.photoPath, photoPath) ||
                other.photoPath == photoPath) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.selectedCemetery, selectedCemetery) ||
                other.selectedCemetery == selectedCemetery) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.showErrors, showErrors) ||
                other.showErrors == showErrors) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.cemeteryErrorMessage, cemeteryErrorMessage) ||
                other.cemeteryErrorMessage == cemeteryErrorMessage));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        status,
        adminDataStatus,
        cemeteryCreationStatus,
        const DeepCollectionEquality().hash(regions),
        const DeepCollectionEquality().hash(districts),
        const DeepCollectionEquality().hash(settlements),
        const DeepCollectionEquality().hash(cemeteries),
        selectedRegion,
        selectedDistrict,
        selectedSettlement,
        gpsStatus,
        ocrStatus,
        fullName,
        birthDate,
        deathDate,
        bio,
        photoPath,
        photoUrl,
        selectedCemetery,
        latitude,
        longitude,
        showErrors,
        errorMessage,
        cemeteryErrorMessage
      ]);

  @override
  String toString() {
    return 'DigitizeState(status: $status, adminDataStatus: $adminDataStatus, cemeteryCreationStatus: $cemeteryCreationStatus, regions: $regions, districts: $districts, settlements: $settlements, cemeteries: $cemeteries, selectedRegion: $selectedRegion, selectedDistrict: $selectedDistrict, selectedSettlement: $selectedSettlement, gpsStatus: $gpsStatus, ocrStatus: $ocrStatus, fullName: $fullName, birthDate: $birthDate, deathDate: $deathDate, bio: $bio, photoPath: $photoPath, photoUrl: $photoUrl, selectedCemetery: $selectedCemetery, latitude: $latitude, longitude: $longitude, showErrors: $showErrors, errorMessage: $errorMessage, cemeteryErrorMessage: $cemeteryErrorMessage)';
  }
}

/// @nodoc
abstract mixin class $DigitizeStateCopyWith<$Res> {
  factory $DigitizeStateCopyWith(
          DigitizeState value, $Res Function(DigitizeState) _then) =
      _$DigitizeStateCopyWithImpl;
  @useResult
  $Res call(
      {LoadingStatus status,
      LoadingStatus adminDataStatus,
      LoadingStatus cemeteryCreationStatus,
      List<Region> regions,
      List<District> districts,
      List<Settlement> settlements,
      List<Cemetery> cemeteries,
      Region? selectedRegion,
      District? selectedDistrict,
      Settlement? selectedSettlement,
      GpsStatus gpsStatus,
      OcrStatus ocrStatus,
      String fullName,
      String birthDate,
      String deathDate,
      String bio,
      String? photoPath,
      String? photoUrl,
      Cemetery? selectedCemetery,
      double? latitude,
      double? longitude,
      bool showErrors,
      String? errorMessage,
      String? cemeteryErrorMessage});
}

/// @nodoc
class _$DigitizeStateCopyWithImpl<$Res>
    implements $DigitizeStateCopyWith<$Res> {
  _$DigitizeStateCopyWithImpl(this._self, this._then);

  final DigitizeState _self;
  final $Res Function(DigitizeState) _then;

  /// Create a copy of DigitizeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? adminDataStatus = null,
    Object? cemeteryCreationStatus = null,
    Object? regions = null,
    Object? districts = null,
    Object? settlements = null,
    Object? cemeteries = null,
    Object? selectedRegion = freezed,
    Object? selectedDistrict = freezed,
    Object? selectedSettlement = freezed,
    Object? gpsStatus = null,
    Object? ocrStatus = null,
    Object? fullName = null,
    Object? birthDate = null,
    Object? deathDate = null,
    Object? bio = null,
    Object? photoPath = freezed,
    Object? photoUrl = freezed,
    Object? selectedCemetery = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? showErrors = null,
    Object? errorMessage = freezed,
    Object? cemeteryErrorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      adminDataStatus: null == adminDataStatus
          ? _self.adminDataStatus
          : adminDataStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      cemeteryCreationStatus: null == cemeteryCreationStatus
          ? _self.cemeteryCreationStatus
          : cemeteryCreationStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      regions: null == regions
          ? _self.regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<Region>,
      districts: null == districts
          ? _self.districts
          : districts // ignore: cast_nullable_to_non_nullable
              as List<District>,
      settlements: null == settlements
          ? _self.settlements
          : settlements // ignore: cast_nullable_to_non_nullable
              as List<Settlement>,
      cemeteries: null == cemeteries
          ? _self.cemeteries
          : cemeteries // ignore: cast_nullable_to_non_nullable
              as List<Cemetery>,
      selectedRegion: freezed == selectedRegion
          ? _self.selectedRegion
          : selectedRegion // ignore: cast_nullable_to_non_nullable
              as Region?,
      selectedDistrict: freezed == selectedDistrict
          ? _self.selectedDistrict
          : selectedDistrict // ignore: cast_nullable_to_non_nullable
              as District?,
      selectedSettlement: freezed == selectedSettlement
          ? _self.selectedSettlement
          : selectedSettlement // ignore: cast_nullable_to_non_nullable
              as Settlement?,
      gpsStatus: null == gpsStatus
          ? _self.gpsStatus
          : gpsStatus // ignore: cast_nullable_to_non_nullable
              as GpsStatus,
      ocrStatus: null == ocrStatus
          ? _self.ocrStatus
          : ocrStatus // ignore: cast_nullable_to_non_nullable
              as OcrStatus,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      deathDate: null == deathDate
          ? _self.deathDate
          : deathDate // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      photoPath: freezed == photoPath
          ? _self.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCemetery: freezed == selectedCemetery
          ? _self.selectedCemetery
          : selectedCemetery // ignore: cast_nullable_to_non_nullable
              as Cemetery?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      showErrors: null == showErrors
          ? _self.showErrors
          : showErrors // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      cemeteryErrorMessage: freezed == cemeteryErrorMessage
          ? _self.cemeteryErrorMessage
          : cemeteryErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DigitizeState].
extension DigitizeStatePatterns on DigitizeState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DigitizeState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DigitizeState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DigitizeState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DigitizeState():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DigitizeState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DigitizeState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            LoadingStatus status,
            LoadingStatus adminDataStatus,
            LoadingStatus cemeteryCreationStatus,
            List<Region> regions,
            List<District> districts,
            List<Settlement> settlements,
            List<Cemetery> cemeteries,
            Region? selectedRegion,
            District? selectedDistrict,
            Settlement? selectedSettlement,
            GpsStatus gpsStatus,
            OcrStatus ocrStatus,
            String fullName,
            String birthDate,
            String deathDate,
            String bio,
            String? photoPath,
            String? photoUrl,
            Cemetery? selectedCemetery,
            double? latitude,
            double? longitude,
            bool showErrors,
            String? errorMessage,
            String? cemeteryErrorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DigitizeState() when $default != null:
        return $default(
            _that.status,
            _that.adminDataStatus,
            _that.cemeteryCreationStatus,
            _that.regions,
            _that.districts,
            _that.settlements,
            _that.cemeteries,
            _that.selectedRegion,
            _that.selectedDistrict,
            _that.selectedSettlement,
            _that.gpsStatus,
            _that.ocrStatus,
            _that.fullName,
            _that.birthDate,
            _that.deathDate,
            _that.bio,
            _that.photoPath,
            _that.photoUrl,
            _that.selectedCemetery,
            _that.latitude,
            _that.longitude,
            _that.showErrors,
            _that.errorMessage,
            _that.cemeteryErrorMessage);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            LoadingStatus status,
            LoadingStatus adminDataStatus,
            LoadingStatus cemeteryCreationStatus,
            List<Region> regions,
            List<District> districts,
            List<Settlement> settlements,
            List<Cemetery> cemeteries,
            Region? selectedRegion,
            District? selectedDistrict,
            Settlement? selectedSettlement,
            GpsStatus gpsStatus,
            OcrStatus ocrStatus,
            String fullName,
            String birthDate,
            String deathDate,
            String bio,
            String? photoPath,
            String? photoUrl,
            Cemetery? selectedCemetery,
            double? latitude,
            double? longitude,
            bool showErrors,
            String? errorMessage,
            String? cemeteryErrorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DigitizeState():
        return $default(
            _that.status,
            _that.adminDataStatus,
            _that.cemeteryCreationStatus,
            _that.regions,
            _that.districts,
            _that.settlements,
            _that.cemeteries,
            _that.selectedRegion,
            _that.selectedDistrict,
            _that.selectedSettlement,
            _that.gpsStatus,
            _that.ocrStatus,
            _that.fullName,
            _that.birthDate,
            _that.deathDate,
            _that.bio,
            _that.photoPath,
            _that.photoUrl,
            _that.selectedCemetery,
            _that.latitude,
            _that.longitude,
            _that.showErrors,
            _that.errorMessage,
            _that.cemeteryErrorMessage);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            LoadingStatus status,
            LoadingStatus adminDataStatus,
            LoadingStatus cemeteryCreationStatus,
            List<Region> regions,
            List<District> districts,
            List<Settlement> settlements,
            List<Cemetery> cemeteries,
            Region? selectedRegion,
            District? selectedDistrict,
            Settlement? selectedSettlement,
            GpsStatus gpsStatus,
            OcrStatus ocrStatus,
            String fullName,
            String birthDate,
            String deathDate,
            String bio,
            String? photoPath,
            String? photoUrl,
            Cemetery? selectedCemetery,
            double? latitude,
            double? longitude,
            bool showErrors,
            String? errorMessage,
            String? cemeteryErrorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DigitizeState() when $default != null:
        return $default(
            _that.status,
            _that.adminDataStatus,
            _that.cemeteryCreationStatus,
            _that.regions,
            _that.districts,
            _that.settlements,
            _that.cemeteries,
            _that.selectedRegion,
            _that.selectedDistrict,
            _that.selectedSettlement,
            _that.gpsStatus,
            _that.ocrStatus,
            _that.fullName,
            _that.birthDate,
            _that.deathDate,
            _that.bio,
            _that.photoPath,
            _that.photoUrl,
            _that.selectedCemetery,
            _that.latitude,
            _that.longitude,
            _that.showErrors,
            _that.errorMessage,
            _that.cemeteryErrorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DigitizeState extends DigitizeState {
  const _DigitizeState(
      {this.status = LoadingStatus.initial,
      this.adminDataStatus = LoadingStatus.initial,
      this.cemeteryCreationStatus = LoadingStatus.initial,
      final List<Region> regions = const [],
      final List<District> districts = const [],
      final List<Settlement> settlements = const [],
      final List<Cemetery> cemeteries = const [],
      this.selectedRegion,
      this.selectedDistrict,
      this.selectedSettlement,
      this.gpsStatus = GpsStatus.idle,
      this.ocrStatus = OcrStatus.idle,
      this.fullName = '',
      this.birthDate = '',
      this.deathDate = '',
      this.bio = '',
      this.photoPath,
      this.photoUrl,
      this.selectedCemetery,
      this.latitude,
      this.longitude,
      this.showErrors = false,
      this.errorMessage,
      this.cemeteryErrorMessage})
      : _regions = regions,
        _districts = districts,
        _settlements = settlements,
        _cemeteries = cemeteries,
        super._();

  @override
  @JsonKey()
  final LoadingStatus status;
  @override
  @JsonKey()
  final LoadingStatus adminDataStatus;
  @override
  @JsonKey()
  final LoadingStatus cemeteryCreationStatus;
  final List<Region> _regions;
  @override
  @JsonKey()
  List<Region> get regions {
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regions);
  }

  final List<District> _districts;
  @override
  @JsonKey()
  List<District> get districts {
    if (_districts is EqualUnmodifiableListView) return _districts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_districts);
  }

  final List<Settlement> _settlements;
  @override
  @JsonKey()
  List<Settlement> get settlements {
    if (_settlements is EqualUnmodifiableListView) return _settlements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_settlements);
  }

  final List<Cemetery> _cemeteries;
  @override
  @JsonKey()
  List<Cemetery> get cemeteries {
    if (_cemeteries is EqualUnmodifiableListView) return _cemeteries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cemeteries);
  }

  @override
  final Region? selectedRegion;
  @override
  final District? selectedDistrict;
  @override
  final Settlement? selectedSettlement;
  @override
  @JsonKey()
  final GpsStatus gpsStatus;
  @override
  @JsonKey()
  final OcrStatus ocrStatus;
  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String birthDate;
  @override
  @JsonKey()
  final String deathDate;
  @override
  @JsonKey()
  final String bio;
  @override
  final String? photoPath;
  @override
  final String? photoUrl;
  @override
  final Cemetery? selectedCemetery;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey()
  final bool showErrors;
  @override
  final String? errorMessage;
  @override
  final String? cemeteryErrorMessage;

  /// Create a copy of DigitizeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DigitizeStateCopyWith<_DigitizeState> get copyWith =>
      __$DigitizeStateCopyWithImpl<_DigitizeState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DigitizeState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.adminDataStatus, adminDataStatus) ||
                other.adminDataStatus == adminDataStatus) &&
            (identical(other.cemeteryCreationStatus, cemeteryCreationStatus) ||
                other.cemeteryCreationStatus == cemeteryCreationStatus) &&
            const DeepCollectionEquality().equals(other._regions, _regions) &&
            const DeepCollectionEquality()
                .equals(other._districts, _districts) &&
            const DeepCollectionEquality()
                .equals(other._settlements, _settlements) &&
            const DeepCollectionEquality()
                .equals(other._cemeteries, _cemeteries) &&
            (identical(other.selectedRegion, selectedRegion) ||
                other.selectedRegion == selectedRegion) &&
            (identical(other.selectedDistrict, selectedDistrict) ||
                other.selectedDistrict == selectedDistrict) &&
            (identical(other.selectedSettlement, selectedSettlement) ||
                other.selectedSettlement == selectedSettlement) &&
            (identical(other.gpsStatus, gpsStatus) ||
                other.gpsStatus == gpsStatus) &&
            (identical(other.ocrStatus, ocrStatus) ||
                other.ocrStatus == ocrStatus) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.deathDate, deathDate) ||
                other.deathDate == deathDate) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.photoPath, photoPath) ||
                other.photoPath == photoPath) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.selectedCemetery, selectedCemetery) ||
                other.selectedCemetery == selectedCemetery) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.showErrors, showErrors) ||
                other.showErrors == showErrors) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.cemeteryErrorMessage, cemeteryErrorMessage) ||
                other.cemeteryErrorMessage == cemeteryErrorMessage));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        status,
        adminDataStatus,
        cemeteryCreationStatus,
        const DeepCollectionEquality().hash(_regions),
        const DeepCollectionEquality().hash(_districts),
        const DeepCollectionEquality().hash(_settlements),
        const DeepCollectionEquality().hash(_cemeteries),
        selectedRegion,
        selectedDistrict,
        selectedSettlement,
        gpsStatus,
        ocrStatus,
        fullName,
        birthDate,
        deathDate,
        bio,
        photoPath,
        photoUrl,
        selectedCemetery,
        latitude,
        longitude,
        showErrors,
        errorMessage,
        cemeteryErrorMessage
      ]);

  @override
  String toString() {
    return 'DigitizeState(status: $status, adminDataStatus: $adminDataStatus, cemeteryCreationStatus: $cemeteryCreationStatus, regions: $regions, districts: $districts, settlements: $settlements, cemeteries: $cemeteries, selectedRegion: $selectedRegion, selectedDistrict: $selectedDistrict, selectedSettlement: $selectedSettlement, gpsStatus: $gpsStatus, ocrStatus: $ocrStatus, fullName: $fullName, birthDate: $birthDate, deathDate: $deathDate, bio: $bio, photoPath: $photoPath, photoUrl: $photoUrl, selectedCemetery: $selectedCemetery, latitude: $latitude, longitude: $longitude, showErrors: $showErrors, errorMessage: $errorMessage, cemeteryErrorMessage: $cemeteryErrorMessage)';
  }
}

/// @nodoc
abstract mixin class _$DigitizeStateCopyWith<$Res>
    implements $DigitizeStateCopyWith<$Res> {
  factory _$DigitizeStateCopyWith(
          _DigitizeState value, $Res Function(_DigitizeState) _then) =
      __$DigitizeStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {LoadingStatus status,
      LoadingStatus adminDataStatus,
      LoadingStatus cemeteryCreationStatus,
      List<Region> regions,
      List<District> districts,
      List<Settlement> settlements,
      List<Cemetery> cemeteries,
      Region? selectedRegion,
      District? selectedDistrict,
      Settlement? selectedSettlement,
      GpsStatus gpsStatus,
      OcrStatus ocrStatus,
      String fullName,
      String birthDate,
      String deathDate,
      String bio,
      String? photoPath,
      String? photoUrl,
      Cemetery? selectedCemetery,
      double? latitude,
      double? longitude,
      bool showErrors,
      String? errorMessage,
      String? cemeteryErrorMessage});
}

/// @nodoc
class __$DigitizeStateCopyWithImpl<$Res>
    implements _$DigitizeStateCopyWith<$Res> {
  __$DigitizeStateCopyWithImpl(this._self, this._then);

  final _DigitizeState _self;
  final $Res Function(_DigitizeState) _then;

  /// Create a copy of DigitizeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? adminDataStatus = null,
    Object? cemeteryCreationStatus = null,
    Object? regions = null,
    Object? districts = null,
    Object? settlements = null,
    Object? cemeteries = null,
    Object? selectedRegion = freezed,
    Object? selectedDistrict = freezed,
    Object? selectedSettlement = freezed,
    Object? gpsStatus = null,
    Object? ocrStatus = null,
    Object? fullName = null,
    Object? birthDate = null,
    Object? deathDate = null,
    Object? bio = null,
    Object? photoPath = freezed,
    Object? photoUrl = freezed,
    Object? selectedCemetery = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? showErrors = null,
    Object? errorMessage = freezed,
    Object? cemeteryErrorMessage = freezed,
  }) {
    return _then(_DigitizeState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      adminDataStatus: null == adminDataStatus
          ? _self.adminDataStatus
          : adminDataStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      cemeteryCreationStatus: null == cemeteryCreationStatus
          ? _self.cemeteryCreationStatus
          : cemeteryCreationStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      regions: null == regions
          ? _self._regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<Region>,
      districts: null == districts
          ? _self._districts
          : districts // ignore: cast_nullable_to_non_nullable
              as List<District>,
      settlements: null == settlements
          ? _self._settlements
          : settlements // ignore: cast_nullable_to_non_nullable
              as List<Settlement>,
      cemeteries: null == cemeteries
          ? _self._cemeteries
          : cemeteries // ignore: cast_nullable_to_non_nullable
              as List<Cemetery>,
      selectedRegion: freezed == selectedRegion
          ? _self.selectedRegion
          : selectedRegion // ignore: cast_nullable_to_non_nullable
              as Region?,
      selectedDistrict: freezed == selectedDistrict
          ? _self.selectedDistrict
          : selectedDistrict // ignore: cast_nullable_to_non_nullable
              as District?,
      selectedSettlement: freezed == selectedSettlement
          ? _self.selectedSettlement
          : selectedSettlement // ignore: cast_nullable_to_non_nullable
              as Settlement?,
      gpsStatus: null == gpsStatus
          ? _self.gpsStatus
          : gpsStatus // ignore: cast_nullable_to_non_nullable
              as GpsStatus,
      ocrStatus: null == ocrStatus
          ? _self.ocrStatus
          : ocrStatus // ignore: cast_nullable_to_non_nullable
              as OcrStatus,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      deathDate: null == deathDate
          ? _self.deathDate
          : deathDate // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      photoPath: freezed == photoPath
          ? _self.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCemetery: freezed == selectedCemetery
          ? _self.selectedCemetery
          : selectedCemetery // ignore: cast_nullable_to_non_nullable
              as Cemetery?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      showErrors: null == showErrors
          ? _self.showErrors
          : showErrors // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      cemeteryErrorMessage: freezed == cemeteryErrorMessage
          ? _self.cemeteryErrorMessage
          : cemeteryErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
