import 'dart:convert';
import 'package:delivery_app/src/models/rol.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    int? id;
    String name;
    String lastname;
    String email;
    String phone;
    String password;
    String? sessionToken;
    String? image;
    List<Rol>? roles = [];

    User({
        this.id,
        required this.name,
        required this.lastname,
        required this.email,
        required this.phone,
        required this.password,
        this.sessionToken,
        this.image,
        this.roles
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        sessionToken: json["session_token"],
        image: json["image"],
        roles: json["roles"] == null ? [] : List<Rol>.from(json["roles"].map((model) => Rol.fromJson(model)))
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "password": password,
        "session_token": sessionToken,
        "image": image,
        "roles": roles,
    };
}
