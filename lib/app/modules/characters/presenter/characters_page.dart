import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_test/app/shared/configs/marvel_config.dart';
import '../domain/entities/character_model.dart';

import 'characters_store.dart';

class CharactersPage extends StatefulWidget {
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState
    extends ModularState<CharactersPage, CharactersStore> {
  final marvelConfig = Modular.get<MarvelConfig>();

  @override
  void initState() {
    controller.listCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      appBar: AppBar(
        title: Image.asset(
          'lib/assets/marvel_logo.png',
          width: 100,
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF202020),
        elevation: 0,
      ),
      body: SafeArea(
        child: Observer(
          builder: (context) {
            return (!controller.loading)
                ? ListView.builder(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: controller.characters.length,
                    itemBuilder: (context, index) {
                      CharacterModel character = controller.characters[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          onTap: () {
                            Modular.to.pushNamed('/characters/$index');
                          },
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              '${character.thumbnail}?apikey=${marvelConfig.getApiKey()}&hash=${marvelConfig.getHash()}&ts=${marvelConfig.getTs()}',
                              fit: BoxFit.fill,
                            ),
                          ),
                          title: Text(
                            character.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
