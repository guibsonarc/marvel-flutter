import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:marvel_test/app/shared/configs/marvel_config.dart';
import 'package:marvel_test/app/shared/configs/marvel_config_interface.dart';

import '../../domain/entities/character_model.dart';
import '../../domain/repositories/characters_repository_interface.dart';

part 'characters_repository.g.dart';

@Injectable()
class CharactersRepository extends Disposable implements ICharactersRepository {
  final DioForNative client;
  final IMarvelConfig marvelConfig;

  CharactersRepository(
    this.client,
    this.marvelConfig,
  );

  @override
  Future<List<CharacterModel>> getCharacters() async {
    final response = await client.get(
      'http://gateway.marvel.com/v1/public/characters',
      queryParameters: {
        'ts': marvelConfig.getTs(),
        'apikey': marvelConfig.getApiKey(),
        'hash': marvelConfig.getHash(),
      },
    );

    if (response.statusCode != 200) return [];

    var results = response.data['data']['results'];
    List<CharacterModel> charactersList = [];

    for (dynamic result in results) {
      CharacterModel character = CharacterModel.fromJson(result);
      charactersList.add(character);
    }

    return charactersList;
  }

  @override
  void dispose() {}
}
