import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'edit_profile_model.g.dart';

@JsonSerializable()
@immutable
class EditProfileModel {
  const EditProfileModel({
    String? name,
    String? location,
    String? workAs,
    String? birthday,
    String? ceo,
    String? workPlace,
    String? overview,
    String? brief,
    String? projects,
    String? email,
    String? phoneNumber,
  })  : _name = name,
        _location = location,
        _workAs = workAs,
        _birthday = birthday,
        _ceo = ceo,
        _workPlace = workPlace,
        _overview = overview,
        _brief = brief,
        _projects = projects,
        _email = email,
        _phoneNumber = phoneNumber;

  factory EditProfileModel.fromJsonStr(String str) =>
      EditProfileModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory EditProfileModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileModelFromJson(json);

  final String? _name;

  final String? _location;

  final String? _workAs;

  final String? _birthday;

  final String? _ceo;

  final String? _workPlace;

  final String? _overview;

  final String? _brief;

  final String? _projects;

  final String? _email;

  final String? _phoneNumber;

  EditProfileModel copyWith({
    String? Function()? name,
    String? Function()? location,
    String? Function()? workAs,
    String? Function()? birthday,
    String? Function()? ceo,
    String? Function()? workPlace,
    String? Function()? overview,
    String? Function()? brief,
    String? Function()? projects,
    String? Function()? email,
    String? Function()? phoneNumber,
  }) {
    return EditProfileModel(
      name: name != null ? name() : _name,
      location: location != null ? location() : _location,
      workAs: workAs != null ? workAs() : _workAs,
      birthday: birthday != null ? birthday() : _birthday,
      ceo: ceo != null ? ceo() : _ceo,
      workPlace: workPlace != null ? workPlace() : _workPlace,
      overview: overview != null ? overview() : _overview,
      brief: brief != null ? brief() : _brief,
      projects: projects != null ? projects() : _projects,
      email: email != null ? email() : _email,
      phoneNumber: phoneNumber != null ? phoneNumber() : _phoneNumber,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$EditProfileModelToJson(this);

  String? get name {
      return _name;
  }

  @JsonKey(name: 'home_place')
  String? get location {
      return _location;
  }

  @JsonKey(name: 'work_as')
  String? get workAs {
    return _workAs;
  }

  String? get birthday {
    return _birthday;
  }

  String? get ceo {
    return _ceo;
  }

  String? get workPlace {
    return _workPlace;
  }

  String? get overview {
    return _overview;
  }

  String? get brief {
    return _brief;
  }

  String? get projects {
    return _projects;
  }

  String? get email {
    return _email;
  }

  @JsonKey(name: 'phone_no')
  String? get phoneNumber {
    return _phoneNumber;
  }
}
