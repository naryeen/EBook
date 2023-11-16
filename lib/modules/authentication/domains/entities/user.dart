import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });
  const User.empty()
      : this(
          id: 1,
          createdAt: '_empty.createAt',
          name: '_empty.name',
          avatar: '_empty.name',
        );

  final int id;
  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [id];
}

// void main() {
//   const user1 = User(
//     id: 1,
//     createdAt: 'createdAt',
//     name: 'name',
//     avatar: ' avatar',
//   );
//   const user2 = User(
//     id: 2,
//     createdAt: 'createdAt',
//     name: 'name',
//     avatar: 'avatar',
//   );
// }
