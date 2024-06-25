import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

User deserializeUser(Map<String, dynamic> map) => User.fromJson(map);

Map<String, dynamic> serializeUser(User user) => user.toJson();

List<User> deserializeUserList(List<Map<String, dynamic>> json) =>
    json.map((e) => User.fromJson(e)).toList();

List<Map<String, dynamic>> serializeUserList(List<User> users) =>
    users.map((e) => e.toJson()).toList();

@freezed
class User with _$User {
  factory User({
    required String id,
    required String username,
    required String email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
