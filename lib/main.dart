import 'package:bootcamp_flutter/app.dart';
import 'package:bootcamp_flutter/models/dadosModel.dart';
import 'package:bootcamp_flutter/models/tarefaModel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as PathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory = await PathProvider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(DadosModelAdapter());
  Hive.registerAdapter(TarefaModelAdapter());

  runApp(const App());
}
