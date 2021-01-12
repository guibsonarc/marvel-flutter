// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CharactersStore = BindInject(
  (i) => CharactersStore(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharactersStore on _CharactersStoreBase, Store {
  final _$loadingAtom = Atom(name: '_CharactersStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$charactersAtom = Atom(name: '_CharactersStoreBase.characters');

  @override
  List<CharacterModel> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(List<CharacterModel> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  final _$listCharactersAsyncAction =
      AsyncAction('_CharactersStoreBase.listCharacters');

  @override
  Future listCharacters() {
    return _$listCharactersAsyncAction.run(() => super.listCharacters());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
characters: ${characters}
    ''';
  }
}
