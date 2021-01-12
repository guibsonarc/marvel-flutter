import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../domain/entities/character_model.dart';
import '../domain/usecases/list_characters_usecase.dart';

part 'characters_store.g.dart';

@Injectable()
class CharactersStore = _CharactersStoreBase with _$CharactersStore;

abstract class _CharactersStoreBase with Store {
  final listCharactersUseCase = Modular.get<ListCharactersUseCase>();

  @observable
  bool loading = false;
  @observable
  List<CharacterModel> characters = [];

  @action
  listCharacters() async {
    loading = true;

    characters = await listCharactersUseCase.listCharacters();

    loading = false;
  }
}
