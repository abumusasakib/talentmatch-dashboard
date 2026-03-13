// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'run_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
RunMetadata _$RunMetadataFromJson(
  Map<String, dynamic> json
) {
    return _$RunMetadataImpl.fromJson(
      json
    );
}

/// @nodoc
mixin _$RunMetadata {

@JsonKey(name: 'date_utc') String get dateUtc; String get python; String get platform; int get seed;@JsonKey(name: 'df_csv_rows') int get dfCsvRows;@JsonKey(name: 'df_xl_rows') int get dfXlRows;@JsonKey(name: 'loaded_via') String get loadedVia;@JsonKey(name: 'model_comparison') List<ModelMetric> get modelComparison;@JsonKey(name: 'shortlisted_rate_summary') ShortlistedRateSummary get shortlistedRateSummary;@JsonKey(name: 'group_thresholding') GroupThresholding get groupThresholding;
/// Create a copy of RunMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RunMetadataCopyWith<RunMetadata> get copyWith => _$RunMetadataCopyWithImpl<RunMetadata>(this as RunMetadata, _$identity);

  /// Serializes this RunMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RunMetadata&&(identical(other.dateUtc, dateUtc) || other.dateUtc == dateUtc)&&(identical(other.python, python) || other.python == python)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.dfCsvRows, dfCsvRows) || other.dfCsvRows == dfCsvRows)&&(identical(other.dfXlRows, dfXlRows) || other.dfXlRows == dfXlRows)&&(identical(other.loadedVia, loadedVia) || other.loadedVia == loadedVia)&&const DeepCollectionEquality().equals(other.modelComparison, modelComparison)&&(identical(other.shortlistedRateSummary, shortlistedRateSummary) || other.shortlistedRateSummary == shortlistedRateSummary)&&(identical(other.groupThresholding, groupThresholding) || other.groupThresholding == groupThresholding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateUtc,python,platform,seed,dfCsvRows,dfXlRows,loadedVia,const DeepCollectionEquality().hash(modelComparison),shortlistedRateSummary,groupThresholding);

@override
String toString() {
  return 'RunMetadata(dateUtc: $dateUtc, python: $python, platform: $platform, seed: $seed, dfCsvRows: $dfCsvRows, dfXlRows: $dfXlRows, loadedVia: $loadedVia, modelComparison: $modelComparison, shortlistedRateSummary: $shortlistedRateSummary, groupThresholding: $groupThresholding)';
}


}

/// @nodoc
abstract mixin class $RunMetadataCopyWith<$Res>  {
  factory $RunMetadataCopyWith(RunMetadata value, $Res Function(RunMetadata) _then) = _$RunMetadataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'date_utc') String dateUtc, String python, String platform, int seed,@JsonKey(name: 'df_csv_rows') int dfCsvRows,@JsonKey(name: 'df_xl_rows') int dfXlRows,@JsonKey(name: 'loaded_via') String loadedVia,@JsonKey(name: 'model_comparison') List<ModelMetric> modelComparison,@JsonKey(name: 'shortlisted_rate_summary') ShortlistedRateSummary shortlistedRateSummary,@JsonKey(name: 'group_thresholding') GroupThresholding groupThresholding
});


$ShortlistedRateSummaryCopyWith<$Res> get shortlistedRateSummary;$GroupThresholdingCopyWith<$Res> get groupThresholding;

}
/// @nodoc
class _$RunMetadataCopyWithImpl<$Res>
    implements $RunMetadataCopyWith<$Res> {
  _$RunMetadataCopyWithImpl(this._self, this._then);

  final RunMetadata _self;
  final $Res Function(RunMetadata) _then;

/// Create a copy of RunMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateUtc = null,Object? python = null,Object? platform = null,Object? seed = null,Object? dfCsvRows = null,Object? dfXlRows = null,Object? loadedVia = null,Object? modelComparison = null,Object? shortlistedRateSummary = null,Object? groupThresholding = null,}) {
  return _then(_self.copyWith(
dateUtc: null == dateUtc ? _self.dateUtc : dateUtc // ignore: cast_nullable_to_non_nullable
as String,python: null == python ? _self.python : python // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int,dfCsvRows: null == dfCsvRows ? _self.dfCsvRows : dfCsvRows // ignore: cast_nullable_to_non_nullable
as int,dfXlRows: null == dfXlRows ? _self.dfXlRows : dfXlRows // ignore: cast_nullable_to_non_nullable
as int,loadedVia: null == loadedVia ? _self.loadedVia : loadedVia // ignore: cast_nullable_to_non_nullable
as String,modelComparison: null == modelComparison ? _self.modelComparison : modelComparison // ignore: cast_nullable_to_non_nullable
as List<ModelMetric>,shortlistedRateSummary: null == shortlistedRateSummary ? _self.shortlistedRateSummary : shortlistedRateSummary // ignore: cast_nullable_to_non_nullable
as ShortlistedRateSummary,groupThresholding: null == groupThresholding ? _self.groupThresholding : groupThresholding // ignore: cast_nullable_to_non_nullable
as GroupThresholding,
  ));
}
/// Create a copy of RunMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShortlistedRateSummaryCopyWith<$Res> get shortlistedRateSummary {
  
  return $ShortlistedRateSummaryCopyWith<$Res>(_self.shortlistedRateSummary, (value) {
    return _then(_self.copyWith(shortlistedRateSummary: value));
  });
}/// Create a copy of RunMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GroupThresholdingCopyWith<$Res> get groupThresholding {
  
  return $GroupThresholdingCopyWith<$Res>(_self.groupThresholding, (value) {
    return _then(_self.copyWith(groupThresholding: value));
  });
}
}


/// Adds pattern-matching-related methods to [RunMetadata].
extension RunMetadataPatterns on RunMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _$RunMetadataImpl value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _$RunMetadataImpl() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _$RunMetadataImpl value)  $default,){
final _that = this;
switch (_that) {
case _$RunMetadataImpl():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _$RunMetadataImpl value)?  $default,){
final _that = this;
switch (_that) {
case _$RunMetadataImpl() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'date_utc')  String dateUtc,  String python,  String platform,  int seed, @JsonKey(name: 'df_csv_rows')  int dfCsvRows, @JsonKey(name: 'df_xl_rows')  int dfXlRows, @JsonKey(name: 'loaded_via')  String loadedVia, @JsonKey(name: 'model_comparison')  List<ModelMetric> modelComparison, @JsonKey(name: 'shortlisted_rate_summary')  ShortlistedRateSummary shortlistedRateSummary, @JsonKey(name: 'group_thresholding')  GroupThresholding groupThresholding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _$RunMetadataImpl() when $default != null:
return $default(_that.dateUtc,_that.python,_that.platform,_that.seed,_that.dfCsvRows,_that.dfXlRows,_that.loadedVia,_that.modelComparison,_that.shortlistedRateSummary,_that.groupThresholding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'date_utc')  String dateUtc,  String python,  String platform,  int seed, @JsonKey(name: 'df_csv_rows')  int dfCsvRows, @JsonKey(name: 'df_xl_rows')  int dfXlRows, @JsonKey(name: 'loaded_via')  String loadedVia, @JsonKey(name: 'model_comparison')  List<ModelMetric> modelComparison, @JsonKey(name: 'shortlisted_rate_summary')  ShortlistedRateSummary shortlistedRateSummary, @JsonKey(name: 'group_thresholding')  GroupThresholding groupThresholding)  $default,) {final _that = this;
switch (_that) {
case _$RunMetadataImpl():
return $default(_that.dateUtc,_that.python,_that.platform,_that.seed,_that.dfCsvRows,_that.dfXlRows,_that.loadedVia,_that.modelComparison,_that.shortlistedRateSummary,_that.groupThresholding);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'date_utc')  String dateUtc,  String python,  String platform,  int seed, @JsonKey(name: 'df_csv_rows')  int dfCsvRows, @JsonKey(name: 'df_xl_rows')  int dfXlRows, @JsonKey(name: 'loaded_via')  String loadedVia, @JsonKey(name: 'model_comparison')  List<ModelMetric> modelComparison, @JsonKey(name: 'shortlisted_rate_summary')  ShortlistedRateSummary shortlistedRateSummary, @JsonKey(name: 'group_thresholding')  GroupThresholding groupThresholding)?  $default,) {final _that = this;
switch (_that) {
case _$RunMetadataImpl() when $default != null:
return $default(_that.dateUtc,_that.python,_that.platform,_that.seed,_that.dfCsvRows,_that.dfXlRows,_that.loadedVia,_that.modelComparison,_that.shortlistedRateSummary,_that.groupThresholding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _$RunMetadataImpl implements RunMetadata {
  const _$RunMetadataImpl({@JsonKey(name: 'date_utc') required this.dateUtc, required this.python, required this.platform, required this.seed, @JsonKey(name: 'df_csv_rows') required this.dfCsvRows, @JsonKey(name: 'df_xl_rows') required this.dfXlRows, @JsonKey(name: 'loaded_via') required this.loadedVia, @JsonKey(name: 'model_comparison') required final  List<ModelMetric> modelComparison, @JsonKey(name: 'shortlisted_rate_summary') required this.shortlistedRateSummary, @JsonKey(name: 'group_thresholding') required this.groupThresholding}): _modelComparison = modelComparison;
  factory _$RunMetadataImpl.fromJson(Map<String, dynamic> json) => _$$RunMetadataImplFromJson(json);

@override@JsonKey(name: 'date_utc') final  String dateUtc;
@override final  String python;
@override final  String platform;
@override final  int seed;
@override@JsonKey(name: 'df_csv_rows') final  int dfCsvRows;
@override@JsonKey(name: 'df_xl_rows') final  int dfXlRows;
@override@JsonKey(name: 'loaded_via') final  String loadedVia;
 final  List<ModelMetric> _modelComparison;
@override@JsonKey(name: 'model_comparison') List<ModelMetric> get modelComparison {
  if (_modelComparison is EqualUnmodifiableListView) return _modelComparison;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_modelComparison);
}

@override@JsonKey(name: 'shortlisted_rate_summary') final  ShortlistedRateSummary shortlistedRateSummary;
@override@JsonKey(name: 'group_thresholding') final  GroupThresholding groupThresholding;

/// Create a copy of RunMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$$RunMetadataImplCopyWith<_$RunMetadataImpl> get copyWith => __$$RunMetadataImplCopyWithImpl<_$RunMetadataImpl>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$$RunMetadataImplToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$RunMetadataImpl&&(identical(other.dateUtc, dateUtc) || other.dateUtc == dateUtc)&&(identical(other.python, python) || other.python == python)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.dfCsvRows, dfCsvRows) || other.dfCsvRows == dfCsvRows)&&(identical(other.dfXlRows, dfXlRows) || other.dfXlRows == dfXlRows)&&(identical(other.loadedVia, loadedVia) || other.loadedVia == loadedVia)&&const DeepCollectionEquality().equals(other._modelComparison, _modelComparison)&&(identical(other.shortlistedRateSummary, shortlistedRateSummary) || other.shortlistedRateSummary == shortlistedRateSummary)&&(identical(other.groupThresholding, groupThresholding) || other.groupThresholding == groupThresholding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateUtc,python,platform,seed,dfCsvRows,dfXlRows,loadedVia,const DeepCollectionEquality().hash(_modelComparison),shortlistedRateSummary,groupThresholding);

@override
String toString() {
  return 'RunMetadata(dateUtc: $dateUtc, python: $python, platform: $platform, seed: $seed, dfCsvRows: $dfCsvRows, dfXlRows: $dfXlRows, loadedVia: $loadedVia, modelComparison: $modelComparison, shortlistedRateSummary: $shortlistedRateSummary, groupThresholding: $groupThresholding)';
}


}

/// @nodoc
abstract mixin class _$$RunMetadataImplCopyWith<$Res> implements $RunMetadataCopyWith<$Res> {
  factory _$$RunMetadataImplCopyWith(_$RunMetadataImpl value, $Res Function(_$RunMetadataImpl) _then) = __$$RunMetadataImplCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'date_utc') String dateUtc, String python, String platform, int seed,@JsonKey(name: 'df_csv_rows') int dfCsvRows,@JsonKey(name: 'df_xl_rows') int dfXlRows,@JsonKey(name: 'loaded_via') String loadedVia,@JsonKey(name: 'model_comparison') List<ModelMetric> modelComparison,@JsonKey(name: 'shortlisted_rate_summary') ShortlistedRateSummary shortlistedRateSummary,@JsonKey(name: 'group_thresholding') GroupThresholding groupThresholding
});


@override $ShortlistedRateSummaryCopyWith<$Res> get shortlistedRateSummary;@override $GroupThresholdingCopyWith<$Res> get groupThresholding;

}
/// @nodoc
class __$$RunMetadataImplCopyWithImpl<$Res>
    implements _$$RunMetadataImplCopyWith<$Res> {
  __$$RunMetadataImplCopyWithImpl(this._self, this._then);

  final _$RunMetadataImpl _self;
  final $Res Function(_$RunMetadataImpl) _then;

/// Create a copy of RunMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateUtc = null,Object? python = null,Object? platform = null,Object? seed = null,Object? dfCsvRows = null,Object? dfXlRows = null,Object? loadedVia = null,Object? modelComparison = null,Object? shortlistedRateSummary = null,Object? groupThresholding = null,}) {
  return _then(_$RunMetadataImpl(
dateUtc: null == dateUtc ? _self.dateUtc : dateUtc // ignore: cast_nullable_to_non_nullable
as String,python: null == python ? _self.python : python // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int,dfCsvRows: null == dfCsvRows ? _self.dfCsvRows : dfCsvRows // ignore: cast_nullable_to_non_nullable
as int,dfXlRows: null == dfXlRows ? _self.dfXlRows : dfXlRows // ignore: cast_nullable_to_non_nullable
as int,loadedVia: null == loadedVia ? _self.loadedVia : loadedVia // ignore: cast_nullable_to_non_nullable
as String,modelComparison: null == modelComparison ? _self._modelComparison : modelComparison // ignore: cast_nullable_to_non_nullable
as List<ModelMetric>,shortlistedRateSummary: null == shortlistedRateSummary ? _self.shortlistedRateSummary : shortlistedRateSummary // ignore: cast_nullable_to_non_nullable
as ShortlistedRateSummary,groupThresholding: null == groupThresholding ? _self.groupThresholding : groupThresholding // ignore: cast_nullable_to_non_nullable
as GroupThresholding,
  ));
}

/// Create a copy of RunMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShortlistedRateSummaryCopyWith<$Res> get shortlistedRateSummary {
  
  return $ShortlistedRateSummaryCopyWith<$Res>(_self.shortlistedRateSummary, (value) {
    return _then(_self.copyWith(shortlistedRateSummary: value));
  });
}/// Create a copy of RunMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GroupThresholdingCopyWith<$Res> get groupThresholding {
  
  return $GroupThresholdingCopyWith<$Res>(_self.groupThresholding, (value) {
    return _then(_self.copyWith(groupThresholding: value));
  });
}
}

// dart format on
