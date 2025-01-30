import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecases/create_user.dart';

import 'authentication_repository.mock.dart';

void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;

  setUp(
    () {
      repository = MockAuthRepo();
      usecase = CreateUser(repository);
    },
  );

  test(
    'should call [AuthenticationRepository.createUser]',
    () async {
      //Arrange
      when(
        () => repository.createUser(
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
          creationDate: any(named: 'creationDate'),
        ),
      ).thenAnswer((_) async => const Right(null));
      //Act
      final result = await usecase(CreateUserParams.empty());

      expect(result, equals(const Right<dynamic, void>(null)));

      //Assert
      verify(
        () => repository.createUser(
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
          creationDate: any(named: 'creationDate'),
        ),
      ).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
