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
    TResult Function(_LoadDigitizeCemeteries value)? loadDigitizeCemeteries,
    TResult Function(_FullNameChanged value)? fullNameChanged,
    TResult Function(_BirthDateChanged value)? birthDateChanged,
    TResult Function(_DeathDateChanged value)? deathDateChanged,
    TResult Function(_BioChanged value)? bioChanged,
    TResult Function(_CemeterySelected value)? cemeterySelected,
    TResult Function(_GetCurrentGps value)? getCurrentGps,
    TResult Function(_SubmitGrave value)? submitGrave,
    TResult Function(_ResetForm value)? resetForm,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadDigitizeCemeteries() when loadDigitizeCemeteries != null:
        return loadDigitizeCemeteries(_that);
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
    required TResult Function(_LoadDigitizeCemeteries value)
        loadDigitizeCemeteries,
    required TResult Function(_FullNameChanged value) fullNameChanged,
    required TResult Function(_BirthDateChanged value) birthDateChanged,
    required TResult Function(_DeathDateChanged value) deathDateChanged,
    required TResult Function(_BioChanged value) bioChanged,
    required TResult Function(_CemeterySelected value) cemeterySelected,
    required TResult Function(_GetCurrentGps value) getCurrentGps,
    required TResult Function(_SubmitGrave value) submitGrave,
    required TResult Function(_ResetForm value) resetForm,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadDigitizeCemeteries():
        return loadDigitizeCemeteries(_that);
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
    TResult? Function(_LoadDigitizeCemeteries value)? loadDigitizeCemeteries,
    TResult? Function(_FullNameChanged value)? fullNameChanged,
    TResult? Function(_BirthDateChanged value)? birthDateChanged,
    TResult? Function(_DeathDateChanged value)? deathDateChanged,
    TResult? Function(_BioChanged value)? bioChanged,
    TResult? Function(_CemeterySelected value)? cemeterySelected,
    TResult? Function(_GetCurrentGps value)? getCurrentGps,
    TResult? Function(_SubmitGrave value)? submitGrave,
    TResult? Function(_ResetForm value)? resetForm,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadDigitizeCemeteries() when loadDigitizeCemeteries != null:
        return loadDigitizeCemeteries(_that);
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
    TResult Function()? loadDigitizeCemeteries,
    TResult Function(String value)? fullNameChanged,
    TResult Function(String value)? birthDateChanged,
    TResult Function(String value)? deathDateChanged,
    TResult Function(String value)? bioChanged,
    TResult Function(Cemetery value)? cemeterySelected,
    TResult Function()? getCurrentGps,
    TResult Function()? submitGrave,
    TResult Function()? resetForm,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoadDigitizeCemeteries() when loadDigitizeCemeteries != null:
        return loadDigitizeCemeteries();
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
    required TResult Function() loadDigitizeCemeteries,
    required TResult Function(String value) fullNameChanged,
    required TResult Function(String value) birthDateChanged,
    required TResult Function(String value) deathDateChanged,
    required TResult Function(String value) bioChanged,
    required TResult Function(Cemetery value) cemeterySelected,
    required TResult Function() getCurrentGps,
    required TResult Function() submitGrave,
    required TResult Function() resetForm,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadDigitizeCemeteries():
        return loadDigitizeCemeteries();
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
    TResult? Function()? loadDigitizeCemeteries,
    TResult? Function(String value)? fullNameChanged,
    TResult? Function(String value)? birthDateChanged,
    TResult? Function(String value)? deathDateChanged,
    TResult? Function(String value)? bioChanged,
    TResult? Function(Cemetery value)? cemeterySelected,
    TResult? Function()? getCurrentGps,
    TResult? Function()? submitGrave,
    TResult? Function()? resetForm,
  }) {
    final _that = this;
    switch (_that) {
      case _LoadDigitizeCemeteries() when loadDigitizeCemeteries != null:
        return loadDigitizeCemeteries();
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
      case _ResetForm() when resetForm != null:
        return resetForm();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LoadDigitizeCemeteries implements DigitizeEvent {
  const _LoadDigitizeCemeteries();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadDigitizeCemeteries);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DigitizeEvent.loadDigitizeCemeteries()';
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

  final Cemetery value;

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
  $Res call({Cemetery value});
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
    Object? value = null,
  }) {
    return _then(_CemeterySelected(
      null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as Cemetery,
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
  GpsStatus get gpsStatus;
  List<Cemetery> get cemeteries;
  String get fullName;
  String get birthDate;
  String get deathDate;
  String get bio;
  Cemetery? get selectedCemetery;
  double? get latitude;
  double? get longitude;
  bool get showErrors;
  String? get errorMessage;

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
            (identical(other.gpsStatus, gpsStatus) ||
                other.gpsStatus == gpsStatus) &&
            const DeepCollectionEquality()
                .equals(other.cemeteries, cemeteries) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.deathDate, deathDate) ||
                other.deathDate == deathDate) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.selectedCemetery, selectedCemetery) ||
                other.selectedCemetery == selectedCemetery) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.showErrors, showErrors) ||
                other.showErrors == showErrors) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      gpsStatus,
      const DeepCollectionEquality().hash(cemeteries),
      fullName,
      birthDate,
      deathDate,
      bio,
      selectedCemetery,
      latitude,
      longitude,
      showErrors,
      errorMessage);

  @override
  String toString() {
    return 'DigitizeState(status: $status, gpsStatus: $gpsStatus, cemeteries: $cemeteries, fullName: $fullName, birthDate: $birthDate, deathDate: $deathDate, bio: $bio, selectedCemetery: $selectedCemetery, latitude: $latitude, longitude: $longitude, showErrors: $showErrors, errorMessage: $errorMessage)';
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
      GpsStatus gpsStatus,
      List<Cemetery> cemeteries,
      String fullName,
      String birthDate,
      String deathDate,
      String bio,
      Cemetery? selectedCemetery,
      double? latitude,
      double? longitude,
      bool showErrors,
      String? errorMessage});
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
    Object? gpsStatus = null,
    Object? cemeteries = null,
    Object? fullName = null,
    Object? birthDate = null,
    Object? deathDate = null,
    Object? bio = null,
    Object? selectedCemetery = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? showErrors = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      gpsStatus: null == gpsStatus
          ? _self.gpsStatus
          : gpsStatus // ignore: cast_nullable_to_non_nullable
              as GpsStatus,
      cemeteries: null == cemeteries
          ? _self.cemeteries
          : cemeteries // ignore: cast_nullable_to_non_nullable
              as List<Cemetery>,
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
            GpsStatus gpsStatus,
            List<Cemetery> cemeteries,
            String fullName,
            String birthDate,
            String deathDate,
            String bio,
            Cemetery? selectedCemetery,
            double? latitude,
            double? longitude,
            bool showErrors,
            String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DigitizeState() when $default != null:
        return $default(
            _that.status,
            _that.gpsStatus,
            _that.cemeteries,
            _that.fullName,
            _that.birthDate,
            _that.deathDate,
            _that.bio,
            _that.selectedCemetery,
            _that.latitude,
            _that.longitude,
            _that.showErrors,
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
    TResult Function(
            LoadingStatus status,
            GpsStatus gpsStatus,
            List<Cemetery> cemeteries,
            String fullName,
            String birthDate,
            String deathDate,
            String bio,
            Cemetery? selectedCemetery,
            double? latitude,
            double? longitude,
            bool showErrors,
            String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DigitizeState():
        return $default(
            _that.status,
            _that.gpsStatus,
            _that.cemeteries,
            _that.fullName,
            _that.birthDate,
            _that.deathDate,
            _that.bio,
            _that.selectedCemetery,
            _that.latitude,
            _that.longitude,
            _that.showErrors,
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
    TResult? Function(
            LoadingStatus status,
            GpsStatus gpsStatus,
            List<Cemetery> cemeteries,
            String fullName,
            String birthDate,
            String deathDate,
            String bio,
            Cemetery? selectedCemetery,
            double? latitude,
            double? longitude,
            bool showErrors,
            String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DigitizeState() when $default != null:
        return $default(
            _that.status,
            _that.gpsStatus,
            _that.cemeteries,
            _that.fullName,
            _that.birthDate,
            _that.deathDate,
            _that.bio,
            _that.selectedCemetery,
            _that.latitude,
            _that.longitude,
            _that.showErrors,
            _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DigitizeState extends DigitizeState {
  const _DigitizeState(
      {this.status = LoadingStatus.initial,
      this.gpsStatus = GpsStatus.idle,
      final List<Cemetery> cemeteries = const [],
      this.fullName = '',
      this.birthDate = '',
      this.deathDate = '',
      this.bio = '',
      this.selectedCemetery,
      this.latitude,
      this.longitude,
      this.showErrors = false,
      this.errorMessage})
      : _cemeteries = cemeteries,
        super._();

  @override
  @JsonKey()
  final LoadingStatus status;
  @override
  @JsonKey()
  final GpsStatus gpsStatus;
  final List<Cemetery> _cemeteries;
  @override
  @JsonKey()
  List<Cemetery> get cemeteries {
    if (_cemeteries is EqualUnmodifiableListView) return _cemeteries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cemeteries);
  }

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
            (identical(other.gpsStatus, gpsStatus) ||
                other.gpsStatus == gpsStatus) &&
            const DeepCollectionEquality()
                .equals(other._cemeteries, _cemeteries) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.deathDate, deathDate) ||
                other.deathDate == deathDate) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.selectedCemetery, selectedCemetery) ||
                other.selectedCemetery == selectedCemetery) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.showErrors, showErrors) ||
                other.showErrors == showErrors) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      gpsStatus,
      const DeepCollectionEquality().hash(_cemeteries),
      fullName,
      birthDate,
      deathDate,
      bio,
      selectedCemetery,
      latitude,
      longitude,
      showErrors,
      errorMessage);

  @override
  String toString() {
    return 'DigitizeState(status: $status, gpsStatus: $gpsStatus, cemeteries: $cemeteries, fullName: $fullName, birthDate: $birthDate, deathDate: $deathDate, bio: $bio, selectedCemetery: $selectedCemetery, latitude: $latitude, longitude: $longitude, showErrors: $showErrors, errorMessage: $errorMessage)';
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
      GpsStatus gpsStatus,
      List<Cemetery> cemeteries,
      String fullName,
      String birthDate,
      String deathDate,
      String bio,
      Cemetery? selectedCemetery,
      double? latitude,
      double? longitude,
      bool showErrors,
      String? errorMessage});
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
    Object? gpsStatus = null,
    Object? cemeteries = null,
    Object? fullName = null,
    Object? birthDate = null,
    Object? deathDate = null,
    Object? bio = null,
    Object? selectedCemetery = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? showErrors = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_DigitizeState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      gpsStatus: null == gpsStatus
          ? _self.gpsStatus
          : gpsStatus // ignore: cast_nullable_to_non_nullable
              as GpsStatus,
      cemeteries: null == cemeteries
          ? _self._cemeteries
          : cemeteries // ignore: cast_nullable_to_non_nullable
              as List<Cemetery>,
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
    ));
  }
}

// dart format on
