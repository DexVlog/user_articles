import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
// import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';
part 'article_model.freezed.dart';

@freezed
class ArticleModel with _$ArticleModel {
  @factoryMethod
  factory ArticleModel(
    // ignore: invalid_annotation_target
    @JsonKey(name: 'author_id') int authorId,
    int id,
    String content,
  ) = _ArticleModel;
  @factoryMethod
  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
}

// @JsonSerializable()
// class ArticleModel {
//   const ArticleModel({
//     required this.id,
//     required this.content,
//     required this.authorId,
//   });

//   final int authorId;
//   final int id;
//   final String content;

//   factory ArticleModel.fromJson(Map<String, dynamic> json) =>
//       _$ArticleModelFromJson(json);

//   Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
//}






// class ArticleModel {
//   const ArticleModel({
//     required this.id,
//     required this.authorId,
//     required this.content,
//   });

//   final int id;
//   final int authorId;
//   final String content;

//   ArticleModel.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         authorId = json['author_id'],
//         content = json['content'];