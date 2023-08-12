import 'package:application/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class UserRepoMockService extends Mock
    implements Client {} // used to create a mock class for http client

void main() {
  group('user repo', () {
    late UserHttpService userHttpService;
    late UserRepoMockService userRepoMockService;
    group('get user data', () {
      setUp(() {
        userRepoMockService = UserRepoMockService();
        userHttpService = UserHttpService(client: userRepoMockService);
      });

      test('when getuserdata functions gets a sucess response', () async {
        //changes the functioning of get method of mocked class
        when(() => userRepoMockService
                .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')))
            .thenAnswer((_) async {
          return Response('''{ 
            "id":1,
            "email":"alan",
            "username":"alanpaul"
          } ''', 200);
        });
        final user = await userHttpService.getUserData();
        expect(user, isA<User>());
      });
    });
    test('when getuserdata function fails', () async {
      when(
        () => userRepoMockService
            .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')),
      ).thenAnswer((invocation) async {
        return Response('{}', 500);
      });
      final user = userHttpService.getUserData();
      expect(user, throwsException);
    });
  });
}
