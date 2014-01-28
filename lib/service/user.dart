library singleapp_user;

import 'dart:convert';

class User {
  String id;
  String name;

  User(this.id, this.name);

  String toJsonString() {
    Map data = {
                "id" : id,
                "name" : name
    };
    return JSON.encode(data);
  }

  factory User.fromJsonMap(Map json) {
    return new User(json['id'], json['name']);
  }
}
