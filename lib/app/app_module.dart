import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:marvel_test/app/app_widget.dart';
import 'package:marvel_test/app/modules/characters/characters_module.dart';

import 'shared/configs/marvel_config.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $MarvelConfig,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: CharactersModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
