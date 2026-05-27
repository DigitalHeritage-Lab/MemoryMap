// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graves_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GravesEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GravesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GravesEvent()';
  }
}

/// @nodoc
class $GravesEventCopyWith<$Res> {
  $GravesEventCopyWith(GravesEvent _, $Res Function(GravesEvent) __);
}

/// Adds pattern-matching-related methods to [GravesEvent].
extension GravesEventPatterns on GravesEvent {
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
    TResult Function(_LoadGraves value)? loadGraves,
    TResult Function(_LoadMoreGraves value)? loadMoreGraves,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadGraves() when loadGraves != null:
        return loadGraves(_that);
      case _LoadMoreGraves() when loadMoreGraves != null:
        return loadMoreGraves(_that);
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
    required TResult Function(_LoadGraves value) loadGraves,
    required TResult Function(_LoadMoreGraves value) loadMoreGraves,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadGraves():
        return loadGraves(_that);
      case _LoadMoreGraves():
        return loadMoreGraves(_that);
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
    TResult? Function(_LoadGraves value)? loadGraves,
    TResult? Function(_LoadMoreGraves value)? loadMoreGraves,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadGraves() when loadGraves != null:
        return loadGraves(_that);
      case _LoadMoreGraves() when loadMoreGraves != null:
        return loadMoreGraves(_that);
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
    TResult Function(String? query)? loadGraves,
    TResult Function()? loadMoreGraves,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadGraves() when loadGraves != null:
        return loadGraves(_that.query);
      case _LoadMoreGraves() when loadMoreGraves != null:
        return loadMoreGraves();
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
    required TResult Function(String? query) loadGraves,
    required TResult Function() loadMoreGraves,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadGraves():
        return loadGraves(_that.query);
      case _LoadMoreGraves():
        return loadMoreGraves();
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
    TResult? Function(String? query)? loadGraves,
    TResult? Function()? loadMoreGraves,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadGraves() when loadGraves != null:
        return loadGraves(_that.query);
      case _LoadMoreGraves() when loadMoreGraves != null:
        return loadMoreGraves();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadGraves implements GravesEvent {
  const _LoadGraves({this.query});

  final String? query;

  /// Create a copy of GravesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadGravesCopyWith<_LoadGraves> get copyWith =>
      __$LoadGravesCopyWithImpl<_LoadGraves>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadGraves &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'GravesEvent.loadGraves(query: $query)';
  }
}

/// @nodoc
abstract mixin class _$LoadGravesCopyWith<$Res>
    implements $GravesEventCopyWith<$Res> {
  factory _$LoadGravesCopyWith(
          _LoadGraves value, $Res Function(_LoadGraves) _then) =
      __$LoadGravesCopyWithImpl;
  @useResult
  $Res call({String? query});
}

/// @nodoc
class __$LoadGravesCopyWithImpl<$Res> implements _$LoadGravesCopyWith<$Res> {
  __$LoadGravesCopyWithImpl(this._self, this._then);

  final _LoadGraves _self;
  final $Res Function(_LoadGraves) _then;

  /// Create a copy of GravesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_LoadGraves(
      query: freezed == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _LoadMoreGraves implements GravesEvent {
  const _LoadMoreGraves();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadMoreGraves);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GravesEvent.loadMoreGraves()';
  }
}

/// @nodoc
mixin _$GravesState {
  LoadingStatus get status;
  List<Grave> get graves;
  bool get hasReachedMax;
  String get query;
  bool get isLoadingMore;
  String? get errorMessage;

  /// Create a copy of GravesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GravesStateCopyWith<GravesState> get copyWith =>
      _$GravesStateCopyWithImpl<GravesState>(this as GravesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GravesState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.graves, graves) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(graves),
      hasReachedMax,
      query,
      isLoadingMore,
      errorMessage);

  @override
  String toString() {
    return 'GravesState(status: $status, graves: $graves, hasReachedMax: $hasReachedMax, query: $query, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $GravesStateCopyWith<$Res> {
  factory $GravesStateCopyWith(
          GravesState value, $Res Function(GravesState) _then) =
      _$GravesStateCopyWithImpl;
  @useResult
  $Res call(
      {LoadingStatus status,
      List<Grave> graves,
      bool hasReachedMax,
      String query,
      bool isLoadingMore,
      String? errorMessage});
}

/// @nodoc
class _$GravesStateCopyWithImpl<$Res> implements $GravesStateCopyWith<$Res> {
  _$GravesStateCopyWithImpl(this._self, this._then);

  final GravesState _self;
  final $Res Function(GravesState) _then;

  /// Create a copy of GravesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? graves = null,
    Object? hasReachedMax = null,
    Object? query = null,
    Object? isLoadingMore = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      graves: null == graves
          ? _self.graves
          : graves // ignore: cast_nullable_to_non_nullable
              as List<Grave>,
      hasReachedMax: null == hasReachedMax
          ? _self.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [GravesState].
extension GravesStatePatterns on GravesState {
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
    TResult Function(_GravesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GravesState() when $default != null:
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
    TResult Function(_GravesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GravesState():
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
    TResult? Function(_GravesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GravesState() when $default != null:
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
            List<Grave> graves,
            bool hasReachedMax,
            String query,
            bool isLoadingMore,
            String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GravesState() when $default != null:
        return $default(_that.status, _that.graves, _that.hasReachedMax,
            _that.query, _that.isLoadingMore, _that.errorMessage);
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
            List<Grave> graves,
            bool hasReachedMax,
            String query,
            bool isLoadingMore,
            String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GravesState():
        return $default(_that.status, _that.graves, _that.hasReachedMax,
            _that.query, _that.isLoadingMore, _that.errorMessage);
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
            List<Grave> graves,
            bool hasReachedMax,
            String query,
            bool isLoadingMore,
            String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GravesState() when $default != null:
        return $default(_that.status, _that.graves, _that.hasReachedMax,
            _that.query, _that.isLoadingMore, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _GravesState implements GravesState {
  const _GravesState(
      {this.status = LoadingStatus.initial,
      final List<Grave> graves = const [],
      this.hasReachedMax = false,
      this.query = '',
      this.isLoadingMore = false,
      this.errorMessage})
      : _graves = graves;

  @override
  @JsonKey()
  final LoadingStatus status;
  final List<Grave> _graves;
  @override
  @JsonKey()
  List<Grave> get graves {
    if (_graves is EqualUnmodifiableListView) return _graves;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_graves);
  }

  @override
  @JsonKey()
  final bool hasReachedMax;
  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  final String? errorMessage;

  /// Create a copy of GravesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GravesStateCopyWith<_GravesState> get copyWith =>
      __$GravesStateCopyWithImpl<_GravesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GravesState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._graves, _graves) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_graves),
      hasReachedMax,
      query,
      isLoadingMore,
      errorMessage);

  @override
  String toString() {
    return 'GravesState(status: $status, graves: $graves, hasReachedMax: $hasReachedMax, query: $query, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$GravesStateCopyWith<$Res>
    implements $GravesStateCopyWith<$Res> {
  factory _$GravesStateCopyWith(
          _GravesState value, $Res Function(_GravesState) _then) =
      __$GravesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {LoadingStatus status,
      List<Grave> graves,
      bool hasReachedMax,
      String query,
      bool isLoadingMore,
      String? errorMessage});
}

/// @nodoc
class __$GravesStateCopyWithImpl<$Res> implements _$GravesStateCopyWith<$Res> {
  __$GravesStateCopyWithImpl(this._self, this._then);

  final _GravesState _self;
  final $Res Function(_GravesState) _then;

  /// Create a copy of GravesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? graves = null,
    Object? hasReachedMax = null,
    Object? query = null,
    Object? isLoadingMore = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_GravesState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      graves: null == graves
          ? _self._graves
          : graves // ignore: cast_nullable_to_non_nullable
              as List<Grave>,
      hasReachedMax: null == hasReachedMax
          ? _self.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
