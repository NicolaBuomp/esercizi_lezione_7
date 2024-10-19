import 'package:json_annotation/json_annotation.dart';

part 'post.model.g.dart';

@JsonSerializable()
class Post {
  final int id;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  // Metodo per creare un Post da un JSON
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  // Metodo per convertire un Post in JSON
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
