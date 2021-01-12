import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvel_test/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  await DotEnv().load('.env');
  runApp(ModularApp(module: AppModule()));
}
