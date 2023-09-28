import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
// import 'package:json_annotation/json_annotation.dart';

part 'author_model.g.dart';
part 'author_model.freezed.dart';

@freezed
class AuthorModel with _$AuthorModel {
  const AuthorModel._();
@factoryMethod
  factory AuthorModel(
    int id,
    String picture,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'first_name') String firstName,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'last_name') String lastName,
  ) = _AuthorModel;

@factoryMethod
  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);

  String get name {
    return '$firstName $lastName';
  }
}



// @JsonSerializable()
// class AuthorModel {
//   const AuthorModel({
//     required this.id,
//     required this.picture,
//     required this.firstName,
//     required this.lastName,
//   });

//   final int id;
//   final String picture;
//   @JsonKey(name: 'first_name')
//   final String firstName;
//   @JsonKey(name: 'last_name')
//   final String lastName;

// factory AuthorModel.fromJson(Map<String, dynamic> json) =>
//       _$AuthorModelFromJson(json);

//   Map<String, dynamic> toJson() => _$AuthorModelToJson(this);

//   String get name {
//     return '$firstName $lastName';
//   }
// }




// class AuthorModel {
//   const AuthorModel({
//     required this.id,
//     required this.picture,
//     required this.firstName,
//     required this.lastName,
//   });

//   final int id;
//   final String picture;
//   final String firstName;
//   final String lastName;

//   String get name {
//     return '$firstName $lastName';
//   }

//   AuthorModel.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         picture = json['picture'],
//         firstName = json['first_name'],
//         lastName = json['last_name'];
// }
