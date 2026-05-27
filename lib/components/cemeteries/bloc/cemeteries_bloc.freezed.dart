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
  String? get query;

  /// Create a copy of CemeteriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CemeteriesEventCopyWith<CemeteriesEvent> get copyWith =>
      _$CemeteriesEventCopyWithImpl<CemeteriesEvent>(
          this as CemeteriesEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CemeteriesEvent &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'CemeteriesEvent(query: $query)';
  }
}

/// @nodoc
abstract mixin class $CemeteriesEventCopyWith<$Res> {
  factory $CemeteriesEventCopyWith(
          CemeteriesEvent value, $Res Function(CemeteriesEvent) _then) =
      _$CemeteriesEventCopyWithImpl;
  @useResult
  $Res call({String? query});
}

/// @nodoc
class _$CemeteriesEventCopyWithImpl<$Res>
    implements $CemeteriesEventCopyWith<$Res> {
  _$CemeteriesEventCopyWithImpl(this._self, this._then);

  final CemeteriesEvent _self;
  final $Res Function(CemeteriesEvent) _then;

  /// Create a copy of CemeteriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_self.copyWith(
      query: freezed == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
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
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteries() when loadCemeteries != null:
        return loadCemeteries(_that);
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
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteries():
        return loadCemeteries(_that);
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
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteries() when loadCemeteries != null:
        return loadCemeteries(_that);
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
    TResult Function(String? query)? loadCemeteries,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteries() when loadCemeteries != null:
        return loadCemeteries(_that.query);
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
    required TResult Function(String? query) loadCemeteries,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteries():
        return loadCemeteries(_that.query);
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
    TResult? Function(String? query)? loadCemeteries,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteries() when loadCemeteries != null:
        return loadCemeteries(_that.query);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadCemeteries implements CemeteriesEvent {
  const _LoadCemeteries({this.query});

  @override
  final String? query;

  /// Create a copy of CemeteriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadCemeteriesCopyWith<_LoadCemeteries> get copyWith =>
      __$LoadCemeteriesCopyWithImpl<_LoadCemeteries>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadCemeteries &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'CemeteriesEvent.loadCemeteries(query: $query)';
  }
}

/// @nodoc
abstract mixin class _$LoadCemeteriesCopyWith<$Res>
    implements $CemeteriesEventCopyWith<$Res> {
  factory _$LoadCemeteriesCopyWith(
          _LoadCemeteries value, $Res Function(_LoadCemeteries) _then) =
      __$LoadCemeteriesCopyWithImpl;
  @override
  @useResult
  $Res call({String? query});
}

/// @nodoc
class __$LoadCemeteriesCopyWithImpl<$Res>
    implements _$LoadCemeteriesCopyWith<$Res> {
  __$LoadCemeteriesCopyWithImpl(this._self, this._then);

  final _LoadCemeteries _self;
  final $Res Function(_LoadCemeteries) _then;

  /// Create a copy of CemeteriesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_LoadCemeteries(
      query: freezed == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$CemeteriesState {
  LoadingStatus get status;
  List<Cemetery> get cemeteries;
  String? get errorMessage;

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
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(cemeteries), errorMessage);

  @override
  String toString() {
    return 'CemeteriesState(status: $status, cemeteries: $cemeteries, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $CemeteriesStateCopyWith<$Res> {
  factory $CemeteriesStateCopyWith(
          CemeteriesState value, $Res Function(CemeteriesState) _then) =
      _$CemeteriesStateCopyWithImpl;
  @useResult
  $Res call(
      {LoadingStatus status, List<Cemetery> cemeteries, String? errorMessage});
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
    TResult Function(LoadingStatus status, List<Cemetery> cemeteries,
            String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CemeteriesState() when $default != null:
        return $default(_that.status, _that.cemeteries, _that.errorMessage);
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
            String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CemeteriesState():
        return $default(_that.status, _that.cemeteries, _that.errorMessage);
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
            String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CemeteriesState() when $default != null:
        return $default(_that.status, _that.cemeteries, _that.errorMessage);
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
  final String? errorMessage;

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
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_cemeteries), errorMessage);

  @override
  String toString() {
    return 'CemeteriesState(status: $status, cemeteries: $cemeteries, errorMessage: $errorMessage)';
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
      {LoadingStatus status, List<Cemetery> cemeteries, String? errorMessage});
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
    ));
  }
}

// dart format on
