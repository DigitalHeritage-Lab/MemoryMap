// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cemeteries_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CemeteriesEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CemeteriesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CemeteriesEvent()';
  }
}

/// @nodoc
class $CemeteriesEventCopyWith<$Res> {
  $CemeteriesEventCopyWith(
      CemeteriesEvent _, $Res Function(CemeteriesEvent) __);
}

/// Adds pattern-matching-related methods to [CemeteriesEvent].
extension CemeteriesEventPatterns on CemeteriesEvent {
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
    TResult Function(_LoadCemeteries value)? loadCemeteries,
    TResult Function(_ChangeLocationMode value)? changeLocationMode,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteries() when loadCemeteries != null:
        return loadCemeteries(_that);
      case _ChangeLocationMode() when changeLocationMode != null:
        return changeLocationMode(_that);
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
    required TResult Function(_LoadCemeteries value) loadCemeteries,
    required TResult Function(_ChangeLocationMode value) changeLocationMode,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteries():
        return loadCemeteries(_that);
      case _ChangeLocationMode():
        return changeLocationMode(_that);
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
    TResult? Function(_LoadCemeteries value)? loadCemeteries,
    TResult? Function(_ChangeLocationMode value)? changeLocationMode,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteries() when loadCemeteries != null:
        return loadCemeteries(_that);
      case _ChangeLocationMode() when changeLocationMode != null:
        return changeLocationMode(_that);
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
    TResult Function(String? query, bool? refreshLocation)? loadCemeteries,
    TResult Function(LocationFilterMode mode, double? latitude,
            double? longitude, String? name)?
        changeLocationMode,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteries() when loadCemeteries != null:
        return loadCemeteries(_that.query, _that.refreshLocation);
      case _ChangeLocationMode() when changeLocationMode != null:
        return changeLocationMode(
            _that.mode, _that.latitude, _that.longitude, _that.name);
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
    required TResult Function(String? query, bool? refreshLocation)
        loadCemeteries,
    required TResult Function(LocationFilterMode mode, double? latitude,
            double? longitude, String? name)
        changeLocationMode,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteries():
        return loadCemeteries(_that.query, _that.refreshLocation);
      case _ChangeLocationMode():
        return changeLocationMode(
            _that.mode, _that.latitude, _that.longitude, _that.name);
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
    TResult? Function(String? query, bool? refreshLocation)? loadCemeteries,
    TResult? Function(LocationFilterMode mode, double? latitude,
            double? longitude, String? name)?
        changeLocationMode,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteries() when loadCemeteries != null:
        return loadCemeteries(_that.query, _that.refreshLocation);
      case _ChangeLocationMode() when changeLocationMode != null:
        return changeLocationMode(
            _that.mode, _that.latitude, _that.longitude, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadCemeteries implements CemeteriesEvent {
  const _LoadCemeteries({this.query, this.refreshLocation});

  final String? query;
  final bool? refreshLocation;

  /// Create a copy of CemeteriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadCemeteriesCopyWith<_LoadCemeteries> get copyWith =>
      __$LoadCemeteriesCopyWithImpl<_LoadCemeteries>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadCemeteries &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.refreshLocation, refreshLocation) ||
                other.refreshLocation == refreshLocation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, refreshLocation);

  @override
  String toString() {
    return 'CemeteriesEvent.loadCemeteries(query: $query, refreshLocation: $refreshLocation)';
  }
}

/// @nodoc
abstract mixin class _$LoadCemeteriesCopyWith<$Res>
    implements $CemeteriesEventCopyWith<$Res> {
  factory _$LoadCemeteriesCopyWith(
          _LoadCemeteries value, $Res Function(_LoadCemeteries) _then) =
      __$LoadCemeteriesCopyWithImpl;
  @useResult
  $Res call({String? query, bool? refreshLocation});
}

/// @nodoc
class __$LoadCemeteriesCopyWithImpl<$Res>
    implements _$LoadCemeteriesCopyWith<$Res> {
  __$LoadCemeteriesCopyWithImpl(this._self, this._then);

  final _LoadCemeteries _self;
  final $Res Function(_LoadCemeteries) _then;

  /// Create a copy of CemeteriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = freezed,
    Object? refreshLocation = freezed,
  }) {
    return _then(_LoadCemeteries(
      query: freezed == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshLocation: freezed == refreshLocation
          ? _self.refreshLocation
          : refreshLocation // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _ChangeLocationMode implements CemeteriesEvent {
  const _ChangeLocationMode(this.mode,
      {this.latitude, this.longitude, this.name});

  final LocationFilterMode mode;
  final double? latitude;
  final double? longitude;
  final String? name;

  /// Create a copy of CemeteriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangeLocationModeCopyWith<_ChangeLocationMode> get copyWith =>
      __$ChangeLocationModeCopyWithImpl<_ChangeLocationMode>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeLocationMode &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode, latitude, longitude, name);

  @override
  String toString() {
    return 'CemeteriesEvent.changeLocationMode(mode: $mode, latitude: $latitude, longitude: $longitude, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ChangeLocationModeCopyWith<$Res>
    implements $CemeteriesEventCopyWith<$Res> {
  factory _$ChangeLocationModeCopyWith(
          _ChangeLocationMode value, $Res Function(_ChangeLocationMode) _then) =
      __$ChangeLocationModeCopyWithImpl;
  @useResult
  $Res call(
      {LocationFilterMode mode,
      double? latitude,
      double? longitude,
      String? name});
}

/// @nodoc
class __$ChangeLocationModeCopyWithImpl<$Res>
    implements _$ChangeLocationModeCopyWith<$Res> {
  __$ChangeLocationModeCopyWithImpl(this._self, this._then);

  final _ChangeLocationMode _self;
  final $Res Function(_ChangeLocationMode) _then;

  /// Create a copy of CemeteriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mode = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? name = freezed,
  }) {
    return _then(_ChangeLocationMode(
      null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as LocationFilterMode,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$CemeteriesState {
  LoadingStatus get status;
  List<Cemetery> get cemeteries;
  String? get errorMessage;
  String get query;
  LocationFilterMode get locationMode;
  double? get userLatitude;
  double? get userLongitude;
  String? get customLocationName;
  String? get gpsError;

  /// Create a copy of CemeteriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CemeteriesStateCopyWith<CemeteriesState> get copyWith =>
      _$CemeteriesStateCopyWithImpl<CemeteriesState>(
          this as CemeteriesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CemeteriesState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.cemeteries, cemeteries) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.locationMode, locationMode) ||
                other.locationMode == locationMode) &&
            (identical(other.userLatitude, userLatitude) ||
                other.userLatitude == userLatitude) &&
            (identical(other.userLongitude, userLongitude) ||
                other.userLongitude == userLongitude) &&
            (identical(other.customLocationName, customLocationName) ||
                other.customLocationName == customLocationName) &&
            (identical(other.gpsError, gpsError) ||
                other.gpsError == gpsError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(cemeteries),
      errorMessage,
      query,
      locationMode,
      userLatitude,
      userLongitude,
      customLocationName,
      gpsError);

  @override
  String toString() {
    return 'CemeteriesState(status: $status, cemeteries: $cemeteries, errorMessage: $errorMessage, query: $query, locationMode: $locationMode, userLatitude: $userLatitude, userLongitude: $userLongitude, customLocationName: $customLocationName, gpsError: $gpsError)';
  }
}

/// @nodoc
abstract mixin class $CemeteriesStateCopyWith<$Res> {
  factory $CemeteriesStateCopyWith(
          CemeteriesState value, $Res Function(CemeteriesState) _then) =
      _$CemeteriesStateCopyWithImpl;
  @useResult
  $Res call(
      {LoadingStatus status,
      List<Cemetery> cemeteries,
      String? errorMessage,
      String query,
      LocationFilterMode locationMode,
      double? userLatitude,
      double? userLongitude,
      String? customLocationName,
      String? gpsError});
}

/// @nodoc
class _$CemeteriesStateCopyWithImpl<$Res>
    implements $CemeteriesStateCopyWith<$Res> {
  _$CemeteriesStateCopyWithImpl(this._self, this._then);

  final CemeteriesState _self;
  final $Res Function(CemeteriesState) _then;

  /// Create a copy of CemeteriesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? cemeteries = null,
    Object? errorMessage = freezed,
    Object? query = null,
    Object? locationMode = null,
    Object? userLatitude = freezed,
    Object? userLongitude = freezed,
    Object? customLocationName = freezed,
    Object? gpsError = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      cemeteries: null == cemeteries
          ? _self.cemeteries
          : cemeteries // ignore: cast_nullable_to_non_nullable
              as List<Cemetery>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      locationMode: null == locationMode
          ? _self.locationMode
          : locationMode // ignore: cast_nullable_to_non_nullable
              as LocationFilterMode,
      userLatitude: freezed == userLatitude
          ? _self.userLatitude
          : userLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      userLongitude: freezed == userLongitude
          ? _self.userLongitude
          : userLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      customLocationName: freezed == customLocationName
          ? _self.customLocationName
          : customLocationName // ignore: cast_nullable_to_non_nullable
              as String?,
      gpsError: freezed == gpsError
          ? _self.gpsError
          : gpsError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CemeteriesState].
extension CemeteriesStatePatterns on CemeteriesState {
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
    TResult Function(_CemeteriesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CemeteriesState() when $default != null:
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
    TResult Function(_CemeteriesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CemeteriesState():
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
    TResult? Function(_CemeteriesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CemeteriesState() when $default != null:
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
            List<Cemetery> cemeteries,
            String? errorMessage,
            String query,
            LocationFilterMode locationMode,
            double? userLatitude,
            double? userLongitude,
            String? customLocationName,
            String? gpsError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CemeteriesState() when $default != null:
        return $default(
            _that.status,
            _that.cemeteries,
            _that.errorMessage,
            _that.query,
            _that.locationMode,
            _that.userLatitude,
            _that.userLongitude,
            _that.customLocationName,
            _that.gpsError);
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
            List<Cemetery> cemeteries,
            String? errorMessage,
            String query,
            LocationFilterMode locationMode,
            double? userLatitude,
            double? userLongitude,
            String? customLocationName,
            String? gpsError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CemeteriesState():
        return $default(
            _that.status,
            _that.cemeteries,
            _that.errorMessage,
            _that.query,
            _that.locationMode,
            _that.userLatitude,
            _that.userLongitude,
            _that.customLocationName,
            _that.gpsError);
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
            List<Cemetery> cemeteries,
            String? errorMessage,
            String query,
            LocationFilterMode locationMode,
            double? userLatitude,
            double? userLongitude,
            String? customLocationName,
            String? gpsError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CemeteriesState() when $default != null:
        return $default(
            _that.status,
            _that.cemeteries,
            _that.errorMessage,
            _that.query,
            _that.locationMode,
            _that.userLatitude,
            _that.userLongitude,
            _that.customLocationName,
            _that.gpsError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CemeteriesState implements CemeteriesState {
  const _CemeteriesState(
      {this.status = LoadingStatus.initial,
      final List<Cemetery> cemeteries = const [],
      this.errorMessage,
      this.query = '',
      this.locationMode = LocationFilterMode.none,
      this.userLatitude,
      this.userLongitude,
      this.customLocationName,
      this.gpsError})
      : _cemeteries = cemeteries;

  @override
  @JsonKey()
  final LoadingStatus status;
  final List<Cemetery> _cemeteries;
  @override
  @JsonKey()
  List<Cemetery> get cemeteries {
    if (_cemeteries is EqualUnmodifiableListView) return _cemeteries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cemeteries);
  }

  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final LocationFilterMode locationMode;
  @override
  final double? userLatitude;
  @override
  final double? userLongitude;
  @override
  final String? customLocationName;
  @override
  final String? gpsError;

  /// Create a copy of CemeteriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CemeteriesStateCopyWith<_CemeteriesState> get copyWith =>
      __$CemeteriesStateCopyWithImpl<_CemeteriesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CemeteriesState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._cemeteries, _cemeteries) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.locationMode, locationMode) ||
                other.locationMode == locationMode) &&
            (identical(other.userLatitude, userLatitude) ||
                other.userLatitude == userLatitude) &&
            (identical(other.userLongitude, userLongitude) ||
                other.userLongitude == userLongitude) &&
            (identical(other.customLocationName, customLocationName) ||
                other.customLocationName == customLocationName) &&
            (identical(other.gpsError, gpsError) ||
                other.gpsError == gpsError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_cemeteries),
      errorMessage,
      query,
      locationMode,
      userLatitude,
      userLongitude,
      customLocationName,
      gpsError);

  @override
  String toString() {
    return 'CemeteriesState(status: $status, cemeteries: $cemeteries, errorMessage: $errorMessage, query: $query, locationMode: $locationMode, userLatitude: $userLatitude, userLongitude: $userLongitude, customLocationName: $customLocationName, gpsError: $gpsError)';
  }
}

/// @nodoc
abstract mixin class _$CemeteriesStateCopyWith<$Res>
    implements $CemeteriesStateCopyWith<$Res> {
  factory _$CemeteriesStateCopyWith(
          _CemeteriesState value, $Res Function(_CemeteriesState) _then) =
      __$CemeteriesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {LoadingStatus status,
      List<Cemetery> cemeteries,
      String? errorMessage,
      String query,
      LocationFilterMode locationMode,
      double? userLatitude,
      double? userLongitude,
      String? customLocationName,
      String? gpsError});
}

/// @nodoc
class __$CemeteriesStateCopyWithImpl<$Res>
    implements _$CemeteriesStateCopyWith<$Res> {
  __$CemeteriesStateCopyWithImpl(this._self, this._then);

  final _CemeteriesState _self;
  final $Res Function(_CemeteriesState) _then;

  /// Create a copy of CemeteriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? cemeteries = null,
    Object? errorMessage = freezed,
    Object? query = null,
    Object? locationMode = null,
    Object? userLatitude = freezed,
    Object? userLongitude = freezed,
    Object? customLocationName = freezed,
    Object? gpsError = freezed,
  }) {
    return _then(_CemeteriesState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      cemeteries: null == cemeteries
          ? _self._cemeteries
          : cemeteries // ignore: cast_nullable_to_non_nullable
              as List<Cemetery>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      locationMode: null == locationMode
          ? _self.locationMode
          : locationMode // ignore: cast_nullable_to_non_nullable
              as LocationFilterMode,
      userLatitude: freezed == userLatitude
          ? _self.userLatitude
          : userLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      userLongitude: freezed == userLongitude
          ? _self.userLongitude
          : userLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      customLocationName: freezed == customLocationName
          ? _self.customLocationName
          : customLocationName // ignore: cast_nullable_to_non_nullable
              as String?,
      gpsError: freezed == gpsError
          ? _self.gpsError
          : gpsError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
