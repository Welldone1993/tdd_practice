import '../../../../core/utils/typedef.dart';
import '../entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultVoid createUser({
    required String name,
    required String avatar,
    required String creationDate,
  });

  ResultFuture<List<User>> getUser();
}
