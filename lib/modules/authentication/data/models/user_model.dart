import 'dart:convert';

import 'package:todo/cores/utils/typedef.dart';
import 'package:todo/modules/authentication/domains/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.avatar,
    required super.id,
    required super.createdAt,
    required super.name,
  });

  const UserModel.empty()
      : this(
          id: '1',
          createdAt: '_empty.createAt',
          name: '_empty.name',
          avatar: '_empty.name',
        );
// string source and return

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel copyWith({
    String? avatar,
    String? id,
    String? createdAt,
    String? name,
  }) {
    return UserModel(
      // if there is a avatar, id, createdAt or name we gonna use them
      // if there is no avatar, id, createdAt or name, we gonna copy existing the
      avatar: avatar ?? this.avatar,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
    );
  }

  // creating and extending the functionalities,
  UserModel.fromMap(DataMap map)
      : this(
          avatar: map['avatar'] as String,
          id: map['id'] as String,
          createdAt: map['createdAt'] as String,
          name: map['name'] as String,
        );

  DataMap toMap() => {
        'id': id,
        'avatar': avatar,
        'createdAt': createdAt,
        'name': name,
      };
  String toJson() => jsonEncode(toMap());
}

// void main() {
//   const user = UserModel.empty();
//   final newUser = user.copyWith(name: 'Naryeen');
// }
