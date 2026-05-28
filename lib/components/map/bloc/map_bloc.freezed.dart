// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MapEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MapEvent()';
  }
}

/// @nodoc
class $MapEventCopyWith<$Res> {
  $MapEventCopyWith(MapEvent _, $Res Function(MapEvent) __);
}

/// Adds pattern-matching-related methods to [MapEvent].
extension MapEventPatterns on MapEvent {
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
    TResult Function(_LoadMarkers value)? loadMarkers,
    TResult Function(_SelectCemetery value)? selectCemetery,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadMarkers() when loadMarkers != null:
        return loadMarkers(_that);
      case _SelectCemetery() when selectCemetery != null:
        return selectCemetery(_that);
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
    required TResult Function(_LoadMarkers value) loadMarkers,
    required TResult Function(_SelectCemetery value) selectCemetery,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadMarkers():
        return loadMarkers(_that);
      case _SelectCemetery():
        return selectCemetery(_that);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(_LoadMarkers value)? loadMarkers,
    TResult? Function(_SelectCemetery value)? selectCemetery,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadMarkers() when loadMarkers != null:
        return loadMarkers(_that);
      case _SelectCemetery() when selectCemetery != null:
        return selectCemetery(_that);
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
    TResult Function()? loadMarkers,
    TResult Function(Cemetery? cemetery)? selectCemetery,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadMarkers() when loadMarkers != null:
        return loadMarkers();
      case _SelectCemetery() when selectCemetery != null:
        return selectCemetery(_that.cemetery);
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
    required TResult Function() loadMarkers,
    required TResult Function(Cemetery? cemetery) selectCemetery,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadMarkers():
        return loadMarkers();
      case _SelectCemetery():
        return selectCemetery(_that.cemetery);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function()? loadMarkers,
    TResult? Function(Cemetery? cemetery)? selectCemetery,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadMarkers() when loadMarkers != null:
        return loadMarkers();
      case _SelectCemetery() when selectCemetery != null:
        return selectCemetery(_that.cemetery);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadMarkers implements MapEvent {
  const _LoadMarkers();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadMarkers);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MapEvent.loadMarkers()';
  }
}

/// @nodoc

class _SelectCemetery implements MapEvent {
  const _SelectCemetery(this.cemetery);

  final Cemetery? cemetery;

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectCemeteryCopyWith<_SelectCemetery> get copyWith =>
      __$SelectCemeteryCopyWithImpl<_SelectCemetery>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectCemetery &&
            (identical(other.cemetery, cemetery) ||
                other.cemetery == cemetery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cemetery);

  @override
  String toString() {
    return 'MapEvent.selectCemetery(cemetery: $cemetery)';
  }
}

/// @nodoc
abstract mixin class _$SelectCemeteryCopyWith<$Res>
    implements $MapEventCopyWith<$Res> {
  factory _$SelectCemeteryCopyWith(
          _SelectCemetery value, $Res Function(_SelectCemetery) _then) =
      __$SelectCemeteryCopyWithImpl;
  @useResult
  $Res call({Cemetery? cemetery});
}

/// @nodoc
class __$SelectCemeteryCopyWithImpl<$Res>
    implements _$SelectCemeteryCopyWith<$Res> {
  __$SelectCemeteryCopyWithImpl(this._self, this._then);

  final _SelectCemetery _self;
  final $Res Function(_SelectCemetery) _then;

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cemetery = freezed,
  }) {
    return _then(_SelectCemetery(
      freezed == cemetery
          ? _self.cemetery
          : cemetery // ignore: cast_nullable_to_non_nullable
              as Cemetery?,
    ));
  }
}

/// @nodoc
mixin _$MapState {
  LoadingStatus get status;
  List<Cemetery> get cemeteries;
  Cemetery? get selectedCemetery;
  String? get errorMessage;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MapStateCopyWith<MapState> get copyWith =>
      _$MapStateCopyWithImpl<MapState>(this as MapState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MapState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.cemeteries, cemeteries) &&
            (identical(other.selectedCemetery, selectedCemetery) ||
                other.selectedCemetery == selectedCemetery) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(cemeteries),
      selectedCemetery,
      errorMessage);

  @override
  String toString() {
    return 'MapState(status: $status, cemeteries: $cemeteries, selectedCemetery: $selectedCemetery, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) _then) =
      _$MapStateCopyWithImpl;
  @useResult
  $Res call(
      {LoadingStatus status,
      List<Cemetery> cemeteries,
      Cemetery? selectedCemetery,
      String? errorMessage});
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res> implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._self, this._then);

  final MapState _self;
  final $Res Function(MapState) _then;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? cemeteries = null,
    Object? selectedCemetery = freezed,
    Object? errorMessage = freezed,
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
      selectedCemetery: freezed == selectedCemetery
          ? _self.selectedCemetery
          : selectedCemetery // ignore: cast_nullable_to_non_nullable
              as Cemetery?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MapState].
extension MapStatePatterns on MapState {
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
    TResult Function(_MapState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MapState() when $default != null:
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
    TResult Function(_MapState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapState():
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
    TResult? Function(_MapState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapState() when $default != null:
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
    TResult Function(LoadingStatus status, List<Cemetery> cemeteries,
            Cemetery? selectedCemetery, String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MapState() when $default != null:
        return $default(_that.status, _that.cemeteries, _that.selectedCemetery,
            _that.errorMessage);
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
    TResult Function(LoadingStatus status, List<Cemetery> cemeteries,
            Cemetery? selectedCemetery, String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapState():
        return $default(_that.status, _that.cemeteries, _that.selectedCemetery,
            _that.errorMessage);
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
    TResult? Function(LoadingStatus status, List<Cemetery> cemeteries,
            Cemetery? selectedCemetery, String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapState() when $default != null:
        return $default(_that.status, _that.cemeteries, _that.selectedCemetery,
            _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MapState implements MapState {
  const _MapState(
      {this.status = LoadingStatus.initial,
      final List<Cemetery> cemeteries = const [],
      this.selectedCemetery,
      this.errorMessage})
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
  final Cemetery? selectedCemetery;
  @override
  final String? errorMessage;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MapStateCopyWith<_MapState> get copyWith =>
      __$MapStateCopyWithImpl<_MapState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MapState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._cemeteries, _cemeteries) &&
            (identical(other.selectedCemetery, selectedCemetery) ||
                other.selectedCemetery == selectedCemetery) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_cemeteries),
      selectedCemetery,
      errorMessage);

  @override
  String toString() {
    return 'MapState(status: $status, cemeteries: $cemeteries, selectedCemetery: $selectedCemetery, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$MapStateCopyWith<$Res>
    implements $MapStateCopyWith<$Res> {
  factory _$MapStateCopyWith(_MapState value, $Res Function(_MapState) _then) =
      __$MapStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {LoadingStatus status,
      List<Cemetery> cemeteries,
      Cemetery? selectedCemetery,
      String? errorMessage});
}

/// @nodoc
class __$MapStateCopyWithImpl<$Res> implements _$MapStateCopyWith<$Res> {
  __$MapStateCopyWithImpl(this._self, this._then);

  final _MapState _self;
  final $Res Function(_MapState) _then;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? cemeteries = null,
    Object? selectedCemetery = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_MapState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      cemeteries: null == cemeteries
          ? _self._cemeteries
          : cemeteries // ignore: cast_nullable_to_non_nullable
              as List<Cemetery>,
      selectedCemetery: freezed == selectedCemetery
          ? _self.selectedCemetery
          : selectedCemetery // ignore: cast_nullable_to_non_nullable
              as Cemetery?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
