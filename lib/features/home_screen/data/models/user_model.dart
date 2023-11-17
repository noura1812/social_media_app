import 'package:social_media_app/features/home_screen/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  String? message;
  UserModel(
      {this.message,
      super.image,
      super.id,
      super.name,
      super.email,
      super.gender,
      super.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["message"] is int) {
      message = json["message"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["gender"] is String) {
      gender = json["gender"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
  }
}
