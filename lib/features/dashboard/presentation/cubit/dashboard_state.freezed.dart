// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState()';
}


}

/// @nodoc
class $DashboardStateCopyWith<$Res>  {
$DashboardStateCopyWith(DashboardState _, $Res Function(DashboardState) __);
}


/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _$InitialImpl value)?  initial,TResult Function( _$LoadingImpl value)?  loading,TResult Function( _$LoadedImpl value)?  loaded,TResult Function( _$ErrorImpl value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _$InitialImpl() when initial != null:
return initial(_that);case _$LoadingImpl() when loading != null:
return loading(_that);case _$LoadedImpl() when loaded != null:
return loaded(_that);case _$ErrorImpl() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _$InitialImpl value)  initial,required TResult Function( _$LoadingImpl value)  loading,required TResult Function( _$LoadedImpl value)  loaded,required TResult Function( _$ErrorImpl value)  error,}){
final _that = this;
switch (_that) {
case _$InitialImpl():
return initial(_that);case _$LoadingImpl():
return loading(_that);case _$LoadedImpl():
return loaded(_that);case _$ErrorImpl():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _$InitialImpl value)?  initial,TResult? Function( _$LoadingImpl value)?  loading,TResult? Function( _$LoadedImpl value)?  loaded,TResult? Function( _$ErrorImpl value)?  error,}){
final _that = this;
switch (_that) {
case _$InitialImpl() when initial != null:
return initial(_that);case _$LoadingImpl() when loading != null:
return loading(_that);case _$LoadedImpl() when loaded != null:
return loaded(_that);case _$ErrorImpl() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DashboardData data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _$InitialImpl() when initial != null:
return initial();case _$LoadingImpl() when loading != null:
return loading();case _$LoadedImpl() when loaded != null:
return loaded(_that.data);case _$ErrorImpl() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DashboardData data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _$InitialImpl():
return initial();case _$LoadingImpl():
return loading();case _$LoadedImpl():
return loaded(_that.data);case _$ErrorImpl():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DashboardData data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _$InitialImpl() when initial != null:
return initial();case _$LoadingImpl() when loading != null:
return loading();case _$LoadedImpl() when loaded != null:
return loaded(_that.data);case _$ErrorImpl() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _$InitialImpl implements DashboardState {
  const _$InitialImpl();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$InitialImpl);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState.initial()';
}


}




/// @nodoc


class _$LoadingImpl implements DashboardState {
  const _$LoadingImpl();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$LoadingImpl);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState.loading()';
}


}




/// @nodoc


class _$LoadedImpl implements DashboardState {
  const _$LoadedImpl({required this.data});
  

 final  DashboardData data;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$$LoadedImplCopyWith<_$LoadedImpl> get copyWith => __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$LoadedImpl&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'DashboardState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class _$$LoadedImplCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(_$LoadedImpl value, $Res Function(_$LoadedImpl) _then) = __$$LoadedImplCopyWithImpl;
@useResult
$Res call({
 DashboardData data
});




}
/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(this._self, this._then);

  final _$LoadedImpl _self;
  final $Res Function(_$LoadedImpl) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_$LoadedImpl(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DashboardData,
  ));
}


}

/// @nodoc


class _$ErrorImpl implements DashboardState {
  const _$ErrorImpl(this.message);
  

 final  String message;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$$ErrorImplCopyWith<_$ErrorImpl> get copyWith => __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ErrorImpl&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DashboardState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$$ErrorImplCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(_$ErrorImpl value, $Res Function(_$ErrorImpl) _then) = __$$ErrorImplCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(this._self, this._then);

  final _$ErrorImpl _self;
  final $Res Function(_$ErrorImpl) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_$ErrorImpl(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
