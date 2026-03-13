// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_metric.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ModelMetric _$ModelMetricFromJson(
  Map<String, dynamic> json
) {
    return _$ModelMetricImpl.fromJson(
      json
    );
}

/// @nodoc
mixin _$ModelMetric {

 String get model; double get accuracy; double get precision; double get recall; double get f1;
/// Create a copy of ModelMetric
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelMetricCopyWith<ModelMetric> get copyWith => _$ModelMetricCopyWithImpl<ModelMetric>(this as ModelMetric, _$identity);

  /// Serializes this ModelMetric to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelMetric&&(identical(other.model, model) || other.model == model)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.precision, precision) || other.precision == precision)&&(identical(other.recall, recall) || other.recall == recall)&&(identical(other.f1, f1) || other.f1 == f1));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,accuracy,precision,recall,f1);

@override
String toString() {
  return 'ModelMetric(model: $model, accuracy: $accuracy, precision: $precision, recall: $recall, f1: $f1)';
}


}

/// @nodoc
abstract mixin class $ModelMetricCopyWith<$Res>  {
  factory $ModelMetricCopyWith(ModelMetric value, $Res Function(ModelMetric) _then) = _$ModelMetricCopyWithImpl;
@useResult
$Res call({
 String model, double accuracy, double precision, double recall, double f1
});




}
/// @nodoc
class _$ModelMetricCopyWithImpl<$Res>
    implements $ModelMetricCopyWith<$Res> {
  _$ModelMetricCopyWithImpl(this._self, this._then);

  final ModelMetric _self;
  final $Res Function(ModelMetric) _then;

/// Create a copy of ModelMetric
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? accuracy = null,Object? precision = null,Object? recall = null,Object? f1 = null,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,accuracy: null == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double,precision: null == precision ? _self.precision : precision // ignore: cast_nullable_to_non_nullable
as double,recall: null == recall ? _self.recall : recall // ignore: cast_nullable_to_non_nullable
as double,f1: null == f1 ? _self.f1 : f1 // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ModelMetric].
extension ModelMetricPatterns on ModelMetric {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _$ModelMetricImpl value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _$ModelMetricImpl() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _$ModelMetricImpl value)  $default,){
final _that = this;
switch (_that) {
case _$ModelMetricImpl():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _$ModelMetricImpl value)?  $default,){
final _that = this;
switch (_that) {
case _$ModelMetricImpl() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String model,  double accuracy,  double precision,  double recall,  double f1)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _$ModelMetricImpl() when $default != null:
return $default(_that.model,_that.accuracy,_that.precision,_that.recall,_that.f1);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String model,  double accuracy,  double precision,  double recall,  double f1)  $default,) {final _that = this;
switch (_that) {
case _$ModelMetricImpl():
return $default(_that.model,_that.accuracy,_that.precision,_that.recall,_that.f1);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String model,  double accuracy,  double precision,  double recall,  double f1)?  $default,) {final _that = this;
switch (_that) {
case _$ModelMetricImpl() when $default != null:
return $default(_that.model,_that.accuracy,_that.precision,_that.recall,_that.f1);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _$ModelMetricImpl implements ModelMetric {
  const _$ModelMetricImpl({required this.model, required this.accuracy, required this.precision, required this.recall, required this.f1});
  factory _$ModelMetricImpl.fromJson(Map<String, dynamic> json) => _$$ModelMetricImplFromJson(json);

@override final  String model;
@override final  double accuracy;
@override final  double precision;
@override final  double recall;
@override final  double f1;

/// Create a copy of ModelMetric
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$$ModelMetricImplCopyWith<_$ModelMetricImpl> get copyWith => __$$ModelMetricImplCopyWithImpl<_$ModelMetricImpl>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$$ModelMetricImplToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ModelMetricImpl&&(identical(other.model, model) || other.model == model)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.precision, precision) || other.precision == precision)&&(identical(other.recall, recall) || other.recall == recall)&&(identical(other.f1, f1) || other.f1 == f1));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,model,accuracy,precision,recall,f1);

@override
String toString() {
  return 'ModelMetric(model: $model, accuracy: $accuracy, precision: $precision, recall: $recall, f1: $f1)';
}


}

/// @nodoc
abstract mixin class _$$ModelMetricImplCopyWith<$Res> implements $ModelMetricCopyWith<$Res> {
  factory _$$ModelMetricImplCopyWith(_$ModelMetricImpl value, $Res Function(_$ModelMetricImpl) _then) = __$$ModelMetricImplCopyWithImpl;
@override @useResult
$Res call({
 String model, double accuracy, double precision, double recall, double f1
});




}
/// @nodoc
class __$$ModelMetricImplCopyWithImpl<$Res>
    implements _$$ModelMetricImplCopyWith<$Res> {
  __$$ModelMetricImplCopyWithImpl(this._self, this._then);

  final _$ModelMetricImpl _self;
  final $Res Function(_$ModelMetricImpl) _then;

/// Create a copy of ModelMetric
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? accuracy = null,Object? precision = null,Object? recall = null,Object? f1 = null,}) {
  return _then(_$ModelMetricImpl(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,accuracy: null == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double,precision: null == precision ? _self.precision : precision // ignore: cast_nullable_to_non_nullable
as double,recall: null == recall ? _self.recall : recall // ignore: cast_nullable_to_non_nullable
as double,f1: null == f1 ? _self.f1 : f1 // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
