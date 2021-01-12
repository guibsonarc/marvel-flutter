import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_test/app/modules/characters/domain/entities/character_model.dart';
import 'package:marvel_test/app/modules/characters/domain/repositories/characters_repository_interface.dart';
import 'package:marvel_test/app/shared/configs/marvel_config_interface.dart';
import 'package:mockito/mockito.dart';
import 'package:marvel_test/app/modules/characters/infra/repositories/characters_repository.dart';

class MockClient extends Mock implements DioForNative {}

class MockMarvelConfig extends Mock implements IMarvelConfig {
  @override
  String getApiKey() {
    return '123';
  }

  @override
  String getTs() {
    return 'abcd';
  }

  @override
  String getHash() {
    return '123abcd';
  }
}

void main() {
  ICharactersRepository repository;
  MockClient client;
  MockMarvelConfig config;

  setUp(() {
    client = MockClient();
    config = MockMarvelConfig();
    repository = CharactersRepository(
      client,
      config,
    );
  });

  group('CharactersRepository Test', () {
    test("Repository should be an instance of CharacterRepository", () {
      expect(repository, isInstanceOf<CharactersRepository>());
    });

    test(
      'getCharacters method should be return a List of CharacterModel',
      () async {
        when(
          client.get(
            'http://gateway.marvel.com/v1/public/characters',
            queryParameters: {
              'ts': config.getTs(),
              'apikey': config.getApiKey(),
              'hash': config.getHash(),
            },
          ),
        ).thenAnswer(
          (_) async => Response(data: {
            'data': {
              'results': [
                {
                  'id': 1,
                  'name': 'Spider-Man',
                  'description': '',
                  'thumbnail': {
                    'path':
                        'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784',
                    'extension': 'jpg',
                  },
                },
              ]
            }
          }, statusCode: 200),
        );

        List<CharacterModel> list = await repository.getCharacters();

        expect(list.length, 1);
        expect(list[0].name, 'Spider-Man');
        expect(
          list[0].thumbnail,
          'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784/standard_xlarge.jpg',
        );
        expect(
          list[0].photo,
          'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784/portrait_uncanny.jpg',
        );
      },
    );
  });
}
