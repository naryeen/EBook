import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  // User(this.id, this.createdAt, this.name, this.avatar);

  const User.empty()
      : this(
          id: '1',
          createdAt: '_empty.createAt',  
          name: '_empty.name',
          avatar: '_empty.name',
        );

  final String id;
  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [id];
}
