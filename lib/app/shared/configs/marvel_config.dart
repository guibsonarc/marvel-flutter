import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import './marvel_config_interface.dart';

part 'marvel_config.g.dart';

@Injectable()
class MarvelConfig implements IMarvelConfig {
  String _privateKey;
  String _publicKey;
  String _ts;

  MarvelConfig() {
    _privateKey = DotEnv().env['PRIVATE_KEY'];
    _publicKey = DotEnv().env['PUBLIC_KEY'];
    _ts = DateTime.now().toString();
  }

  String getTs() {
    return _ts;
  }

  String getApiKey() {
    return _publicKey;
  }

  String getHash() {
    return md5.convert(utf8.encode(_ts + _privateKey + _publicKey)).toString();
  }
}
