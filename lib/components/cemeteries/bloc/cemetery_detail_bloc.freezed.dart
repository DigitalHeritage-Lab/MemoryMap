// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cemetery_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CemeteryDetailEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CemeteryDetailEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CemeteryDetailEvent()';
  }
}

/// @nodoc
class $CemeteryDetailEventCopyWith<$Res> {
  $CemeteryDetailEventCopyWith(
      CemeteryDetailEvent _, $Res Function(CemeteryDetailEvent) __);
}

/// Adds pattern-matching-related methods to [CemeteryDetailEvent].
extension CemeteryDetailEventPatterns on CemeteryDetailEvent {
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
    TResult Function(_LoadCemeteryDetail value)? loadCemeteryDetail,
    TResult Function(_LoadMoreGraves value)? loadMoreGraves,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteryDetail() when loadCemeteryDetail != null:
        return loadCemeteryDetail(_that);
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
    required TResult Function(_LoadCemeteryDetail value) loadCemeteryDetail,
    required TResult Function(_LoadMoreGraves value) loadMoreGraves,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteryDetail():
        return loadCemeteryDetail(_that);
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
    TResult? Function(_LoadCemeteryDetail value)? loadCemeteryDetail,
    TResult? Function(_LoadMoreGraves value)? loadMoreGraves,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteryDetail() when loadCemeteryDetail != null:
        return loadCemeteryDetail(_that);
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
    TResult Function(String id)? loadCemeteryDetail,
    TResult Function()? loadMoreGraves,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteryDetail() when loadCemeteryDetail != null:
        return loadCemeteryDetail(_that.id);
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
    required TResult Function(String id) loadCemeteryDetail,
    required TResult Function() loadMoreGraves,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteryDetail():
        return loadCemeteryDetail(_that.id);
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
    TResult? Function(String id)? loadCemeteryDetail,
    TResult? Function()? loadMoreGraves,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadCemeteryDetail() when loadCemeteryDetail != null:
        return loadCemeteryDetail(_that.id);
      case _LoadMoreGraves() when loadMoreGraves != null:
        return loadMoreGraves();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadCemeteryDetail implements CemeteryDetailEvent {
  const _LoadCemeteryDetail(this.id);

  final String id;

  /// Create a copy of CemeteryDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadCemeteryDetailCopyWith<_LoadCemeteryDetail> get copyWith =>
      __$LoadCemeteryDetailCopyWithImpl<_LoadCemeteryDetail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadCemeteryDetail &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'CemeteryDetailEvent.loadCemeteryDetail(id: $id)';
  }
}

/// @nodoc
abstract mixin class _$LoadCemeteryDetailCopyWith<$Res>
    implements $CemeteryDetailEventCopyWith<$Res> {
  factory _$LoadCemeteryDetailCopyWith(
          _LoadCemeteryDetail value, $Res Function(_LoadCemeteryDetail) _then) =
      __$LoadCemeteryDetailCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$LoadCemeteryDetailCopyWithImpl<$Res>
    implements _$LoadCemeteryDetailCopyWith<$Res> {
  __$LoadCemeteryDetailCopyWithImpl(this._self, this._then);

  final _LoadCemeteryDetail _self;
  final $Res Function(_LoadCemeteryDetail) _then;

  /// Create a copy of CemeteryDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(_LoadCemeteryDetail(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _LoadMoreGraves implements CemeteryDetailEvent {
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
    return 'CemeteryDetailEvent.loadMoreGraves()';
  }
}

/// @nodoc
mixin _$CemeteryDetailState {
  LoadingStatus get status;
  Cemetery? get cemetery;
  List<Grave> get graves;
  String? get errorMessage;
  bool get hasReachedMax;
  bool get isLoadingMore;

  /// Create a copy of CemeteryDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CemeteryDetailStateCopyWith<CemeteryDetailState> get copyWith =>
      _$CemeteryDetailStateCopyWithImpl<CemeteryDetailState>(
          this as CemeteryDetailState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CemeteryDetailState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cemetery, cemetery) ||
                other.cemetery == cemetery) &&
            const DeepCollectionEquality().equals(other.graves, graves) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      cemetery,
      const DeepCollectionEquality().hash(graves),
      errorMessage,
      hasReachedMax,
      isLoadingMore);

  @override
  String toString() {
    return 'CemeteryDetailState(status: $status, cemetery: $cemetery, graves: $graves, errorMessage: $errorMessage, hasReachedMax: $hasReachedMax, isLoadingMore: $isLoadingMore)';
  }
}

/// @nodoc
abstract mixin class $CemeteryDetailStateCopyWith<$Res> {
  factory $CemeteryDetailStateCopyWith(
          CemeteryDetailState value, $Res Function(CemeteryDetailState) _then) =
      _$CemeteryDetailStateCopyWithImpl;
  @useResult
  $Res call(
      {LoadingStatus status,
      Cemetery? cemetery,
      List<Grave> graves,
      String? errorMessage,
      bool hasReachedMax,
      bool isLoadingMore});
}

/// @nodoc
class _$CemeteryDetailStateCopyWithImpl<$Res>
    implements $CemeteryDetailStateCopyWith<$Res> {
  _$CemeteryDetailStateCopyWithImpl(this._self, this._then);

  final CemeteryDetailState _self;
  final $Res Function(CemeteryDetailState) _then;

  /// Create a copy of CemeteryDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? cemetery = freezed,
    Object? graves = null,
    Object? errorMessage = freezed,
    Object? hasReachedMax = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      cemetery: freezed == cemetery
          ? _self.cemetery
          : cemetery // ignore: cast_nullable_to_non_nullable
              as Cemetery?,
      graves: null == graves
          ? _self.graves
          : graves // ignore: cast_nullable_to_non_nullable
              as List<Grave>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      hasReachedMax: null == hasReachedMax
          ? _self.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [CemeteryDetailState].
extension CemeteryDetailStatePatterns on CemeteryDetailState {
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
    TResult Function(_CemeteryDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CemeteryDetailState() when $default != null:
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
    TResult Function(_CemeteryDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CemeteryDetailState():
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
    TResult? Function(_CemeteryDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CemeteryDetailState() when $default != null:
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
            Cemetery? cemetery,
            List<Grave> graves,
            String? errorMessage,
            bool hasReachedMax,
            bool isLoadingMore)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CemeteryDetailState() when $default != null:
        return $default(_that.status, _that.cemetery, _that.graves,
            _that.errorMessage, _that.hasReachedMax, _that.isLoadingMore);
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
            Cemetery? cemetery,
            List<Grave> graves,
            String? errorMessage,
            bool hasReachedMax,
            bool isLoadingMore)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CemeteryDetailState():
        return $default(_that.status, _that.cemetery, _that.graves,
            _that.errorMessage, _that.hasReachedMax, _that.isLoadingMore);
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
            Cemetery? cemetery,
            List<Grave> graves,
            String? errorMessage,
            bool hasReachedMax,
            bool isLoadingMore)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CemeteryDetailState() when $default != null:
        return $default(_that.status, _that.cemetery, _that.graves,
            _that.errorMessage, _that.hasReachedMax, _that.isLoadingMore);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CemeteryDetailState implements CemeteryDetailState {
  const _CemeteryDetailState(
      {this.status = LoadingStatus.initial,
      this.cemetery,
      final List<Grave> graves = const [],
      this.errorMessage,
      this.hasReachedMax = false,
      this.isLoadingMore = false})
      : _graves = graves;

  @override
  @JsonKey()
  final LoadingStatus status;
  @override
  final Cemetery? cemetery;
  final List<Grave> _graves;
  @override
  @JsonKey()
  List<Grave> get graves {
    if (_graves is EqualUnmodifiableListView) return _graves;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_graves);
  }

  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool hasReachedMax;
  @override
  @JsonKey()
  final bool isLoadingMore;

  /// Create a copy of CemeteryDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CemeteryDetailStateCopyWith<_CemeteryDetailState> get copyWith =>
      __$CemeteryDetailStateCopyWithImpl<_CemeteryDetailState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CemeteryDetailState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cemetery, cemetery) ||
                other.cemetery == cemetery) &&
            const DeepCollectionEquality().equals(other._graves, _graves) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      cemetery,
      const DeepCollectionEquality().hash(_graves),
      errorMessage,
      hasReachedMax,
      isLoadingMore);

  @override
  String toString() {
    return 'CemeteryDetailState(status: $status, cemetery: $cemetery, graves: $graves, errorMessage: $errorMessage, hasReachedMax: $hasReachedMax, isLoadingMore: $isLoadingMore)';
  }
}

/// @nodoc
abstract mixin class _$CemeteryDetailStateCopyWith<$Res>
    implements $CemeteryDetailStateCopyWith<$Res> {
  factory _$CemeteryDetailStateCopyWith(_CemeteryDetailState value,
          $Res Function(_CemeteryDetailState) _then) =
      __$CemeteryDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {LoadingStatus status,
      Cemetery? cemetery,
      List<Grave> graves,
      String? errorMessage,
      bool hasReachedMax,
      bool isLoadingMore});
}

/// @nodoc
class __$CemeteryDetailStateCopyWithImpl<$Res>
    implements _$CemeteryDetailStateCopyWith<$Res> {
  __$CemeteryDetailStateCopyWithImpl(this._self, this._then);

  final _CemeteryDetailState _self;
  final $Res Function(_CemeteryDetailState) _then;

  /// Create a copy of CemeteryDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? cemetery = freezed,
    Object? graves = null,
    Object? errorMessage = freezed,
    Object? hasReachedMax = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_CemeteryDetailState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      cemetery: freezed == cemetery
          ? _self.cemetery
          : cemetery // ignore: cast_nullable_to_non_nullable
              as Cemetery?,
      graves: null == graves
          ? _self._graves
          : graves // ignore: cast_nullable_to_non_nullable
              as List<Grave>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      hasReachedMax: null == hasReachedMax
          ? _self.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
