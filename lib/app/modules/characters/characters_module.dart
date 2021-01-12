import 'package:dio/native_imp.dart';
import 'domain/usecases/list_characters_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'infra/repositories/characters_repository.dart';
import 'presenter/characters_detail_page.dart';
import 'presenter/characters_page.dart';
import 'presenter/characters_store.dart';

final $DioForNative = BindInject(
  (i) => DioForNative(),
  singleton: true,
  lazy: true,
);

class CharactersModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $DioForNative,
        $ListCharactersUseCase,
        $CharactersRepository,
        $CharactersStore,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/characters',
          child: (_, args) => CharactersPage(),
        ),
        ModularRouter(
          '/characters/:index',
          child: (_, args) => CharactersDetailPage(
            index: int.parse(args.params['index']),
          ),
        ),
      ];

  static Inject get to => Inject<CharactersModule>.of();
}
