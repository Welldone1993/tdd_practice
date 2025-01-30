import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';
import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecases/get_user.dart';

import 'authentication_repository.mock.dart';

void main() {
  late AuthenticationRepository repository;
  late GetUser usecase;

  setUp(
    () {
      repository = MockAuthRepo();
      usecase = GetUser(repository);
    },
  );

  const response = [User.empty()];

  test(
    'should call [AuthenticationRepository.getUser] and return [List<Users>]',
    () async {
      //Arrange
      when(() => repository.getUser()).thenAnswer(
        (_) async => const Right(response),
      );

      //Act
      final result = await usecase();

      expect(result, equals(const Right<dynamic, List<User>>(response)));

      //Assert
      verify(
        () => repository.getUser(),
      ).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
