import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String creationDate;
  final String avatar;

  const User({
    required this.id,
    required this.name,
    required this.creationDate,
    required this.avatar,
  });

  const User.empty()
      : this(
          id: 1,
          creationDate: '_empty.CreationDate',
          name: '_empty.name',
          avatar: '_empty.avatar',
        );

  @override
  List<Object?> get props => [id];
}
