import '../../domain/entities/character_model.dart';

abstract class ICharactersRepository {
  Future<List<CharacterModel>> getCharacters();
}
