// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlogListModel _$BlogListModelFromJson(Map<String, dynamic> json) {
  return _BlogListModel.fromJson(json);
}

/// @nodoc
mixin _$BlogListModel {
  List<Blog> get blogs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlogListModelCopyWith<BlogListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogListModelCopyWith<$Res> {
  factory $BlogListModelCopyWith(
          BlogListModel value, $Res Function(BlogListModel) then) =
      _$BlogListModelCopyWithImpl<$Res, BlogListModel>;
  @useResult
  $Res call({List<Blog> blogs});
}

/// @nodoc
class _$BlogListModelCopyWithImpl<$Res, $Val extends BlogListModel>
    implements $BlogListModelCopyWith<$Res> {
  _$BlogListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blogs = null,
  }) {
    return _then(_value.copyWith(
      blogs: null == blogs
          ? _value.blogs
          : blogs // ignore: cast_nullable_to_non_nullable
              as List<Blog>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlogListModelImplCopyWith<$Res>
    implements $BlogListModelCopyWith<$Res> {
  factory _$$BlogListModelImplCopyWith(
          _$BlogListModelImpl value, $Res Function(_$BlogListModelImpl) then) =
      __$$BlogListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Blog> blogs});
}

/// @nodoc
class __$$BlogListModelImplCopyWithImpl<$Res>
    extends _$BlogListModelCopyWithImpl<$Res, _$BlogListModelImpl>
    implements _$$BlogListModelImplCopyWith<$Res> {
  __$$BlogListModelImplCopyWithImpl(
      _$BlogListModelImpl _value, $Res Function(_$BlogListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blogs = null,
  }) {
    return _then(_$BlogListModelImpl(
      blogs: null == blogs
          ? _value._blogs
          : blogs // ignore: cast_nullable_to_non_nullable
              as List<Blog>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlogListModelImpl implements _BlogListModel {
  const _$BlogListModelImpl({required final List<Blog> blogs}) : _blogs = blogs;

  factory _$BlogListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlogListModelImplFromJson(json);

  final List<Blog> _blogs;
  @override
  List<Blog> get blogs {
    if (_blogs is EqualUnmodifiableListView) return _blogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blogs);
  }

  @override
  String toString() {
    return 'BlogListModel(blogs: $blogs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogListModelImpl &&
            const DeepCollectionEquality().equals(other._blogs, _blogs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_blogs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogListModelImplCopyWith<_$BlogListModelImpl> get copyWith =>
      __$$BlogListModelImplCopyWithImpl<_$BlogListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlogListModelImplToJson(
      this,
    );
  }
}

abstract class _BlogListModel implements BlogListModel {
  const factory _BlogListModel({required final List<Blog> blogs}) =
      _$BlogListModelImpl;

  factory _BlogListModel.fromJson(Map<String, dynamic> json) =
      _$BlogListModelImpl.fromJson;

  @override
  List<Blog> get blogs;
  @override
  @JsonKey(ignore: true)
  _$$BlogListModelImplCopyWith<_$BlogListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
