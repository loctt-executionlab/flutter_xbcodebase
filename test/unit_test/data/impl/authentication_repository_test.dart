import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xbcodebase/data/impl/authentication_repository_impl.dart';
import 'package:xbcodebase/domain/models/token_response.dart';
import 'package:xbcodebase/domain/repositories/authentication_repository.dart';
import 'package:xbcodebase/tunnels.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<FlutterSecureStorage>(), MockSpec<Dio>()])
import 'authentication_repository_test.mocks.dart';

void main() {
  final dio = MockDio();
  final storage = MockFlutterSecureStorage();
  final authenticationRepositoryImpl =
      AuthenticationRepositoryImpl(dio, storage);
  group('AuthenticationRepositoryImpl test', () {
    test('should impl AuthenticationRepository', () {
      expect(authenticationRepositoryImpl,
          isInstanceOf<AuthenticationRepository>());
    });

    group('login()', () {
      const email = 'email';
      const password = 'password';

      final stubbedResponse =
          Future.value(Response(requestOptions: RequestOptions(path: '')));
      test('should call functions', () {
        when(dio.post(any, data: anyNamed('data')))
            .thenAnswer((_) => stubbedResponse);
        final result = authenticationRepositoryImpl.logIn(email, password);
        expectLater(result, isInstanceOf<Future>());
        verify(dio.post(any, data: anyNamed('data'))).called(1);
        // verify(authenticationRepositoryImpl.mapResponseToResult).called(1);
      });
    });
  });
}
