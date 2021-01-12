import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_test/app/modules/characters/domain/entities/character_model.dart';
import 'package:marvel_test/app/modules/characters/domain/repositories/characters_repository_interface.dart';
import 'package:marvel_test/app/modules/characters/domain/usecases/list_characters_usecase.dart';
import 'package:mockito/mockito.dart';

class MockCharactersRepository extends Mock implements ICharactersRepository {}

void main() {
  ListCharactersUseCase useCase;
  MockCharactersRepository repository;

  setUp(() {
    repository = MockCharactersRepository();
    useCase = ListCharactersUseCase(repository);
  });
//
  group('ListCharactersService Test', () {
    test("UseCase should be an instance of ListCharactersUseCase", () {
      expect(useCase, isInstanceOf<ListCharactersUseCase>());
    });

    test(
      "listCharacters method should be return a List of CharacterModel",
      () async {
        when(repository.getCharacters()).thenAnswer(
          (_) async => <CharacterModel>[
            CharacterModel(
              id: 1,
              name: 'Siper-Man',
            ),
            CharacterModel(
              id: 2,
              name: 'Superman',
            ),
          ],
        );

        List<CharacterModel> list = await repository.getCharacters();

        expect(list.length, 2);
        expect(list[0].name, 'Siper-Man');
        expect(list[1].name, 'Superman');
      },
    );
  });
}
