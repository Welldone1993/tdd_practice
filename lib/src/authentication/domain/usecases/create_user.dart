import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/authentication_repository.dart';

class CreateUser extends UsecaseWithParams {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultVoid call(params) async => _repository.createUser(
        name: 'name',
        avatar: 'avatar',
        creationDate: 'creationDate',
      );
}

class CreateUserParams extends Equatable {
  final String name;
  final String avatar;
  final String creationDate;

  const CreateUserParams({
    required this.name,
    required this.avatar,
    required this.creationDate,
  });

  @override
  List<Object?> get props => [name, avatar, creationDate];
}
