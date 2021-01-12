import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_test/app/shared/configs/marvel_config.dart';
import '../domain/entities/character_model.dart';

import 'characters_store.dart';

class CharactersDetailPage extends StatefulWidget {
  final int index;

  const CharactersDetailPage({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  _CharactersDetailPageState createState() => _CharactersDetailPageState();
}

class _CharactersDetailPageState extends State<CharactersDetailPage> {
  final controller = Modular.get<CharactersStore>();
  final marvelConfig = Modular.get<MarvelConfig>();
  CharacterModel character;

  @override
  void initState() {
    character = controller.characters[widget.index];
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
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
          child: Center(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    '${character.photo}?apikey=${marvelConfig.getApiKey()}&hash=${marvelConfig.getHash()}&ts=${marvelConfig.getTs()}',
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    character.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                character.description.isNotEmpty
                    ? Text(
                        character.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : Text(
                        'Essa personagem não tem descrição :(',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
