import 'package:flutter_modular/flutter_modular.dart';
import '../repositories/characters_repository_interface.dart';
import '../entities/character_model.dart';

part 'list_characters_usecase.g.dart';

@Injectable()
class ListCharactersUseCase extends Disposable {
  final ICharactersRepository repository;

  ListCharactersUseCase(this.repository);

  Future<List<CharacterModel>> listCharacters() async {
    return await repository.getCharacters();
  }

  @override
  void dispose() {}
}
