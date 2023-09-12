import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_KEYS {
  NOME_KEY,
  DATANASC_KEY,
  NIVEL_KEY,
  EXP_KEY,
  LINGUAGEM_KEY,
  SALARIO_KEY,
  USUARIO_KEY,
  ALTURA_KEY,
  THEME_KEY,
  NOTIFICATION_KEY,
  RANDOM_NUM_KEY,
  RANDOM_QUANTITY_KEY
}

class AppStorage {
  late SharedPreferences _store;

  AppStorage() {
    _initStore();
  }

  void _initStore() async => _store = await SharedPreferences.getInstance();
  //SETS
  Future<bool> setDataNasc_Cadastro(DateTime dataNasc) async =>
      await _setString(
          STORAGE_KEYS.DATANASC_KEY.toString(), dataNasc.toLocal().toString());

  Future<bool> setLinguagemPref_Cadastro(List<String> lingPref) async =>
      await _setListString(STORAGE_KEYS.LINGUAGEM_KEY.toString(), lingPref);

  Future<bool> setSalario_Cadastro(double salario) async =>
      await _setDouble(STORAGE_KEYS.SALARIO_KEY.toString(), salario);

  Future<bool> setNome_Cadastro(String nome) async =>
      await _setString(STORAGE_KEYS.NOME_KEY.toString(), nome);

  Future<bool> setExperiencia_Cadastro(int exp) async =>
      await _setInt(STORAGE_KEYS.NOME_KEY.toString(), exp);

  Future<bool> setNivel_Cadastro(String nivel) async =>
      await _setString(STORAGE_KEYS.NOME_KEY.toString(), nivel);

  Future<bool> setUsuario_Config(String usuario) async =>
      await _setString(STORAGE_KEYS.USUARIO_KEY.toString(), usuario);

  Future<bool> setAltura_Config(double altura) async =>
      await _setDouble(STORAGE_KEYS.ALTURA_KEY.toString(), altura);

  Future<bool> setDarkTheme_Config(bool isDarkTheme) async =>
      await _setBool(STORAGE_KEYS.THEME_KEY.toString(), isDarkTheme);

  Future<bool> setNotification_Config(bool notification) async =>
      await _setBool(STORAGE_KEYS.NOTIFICATION_KEY.toString(), notification);

  Future<bool> setRandomNumber_Random(int number) =>
      _setInt(STORAGE_KEYS.RANDOM_NUM_KEY.toString(),number);

  Future<bool> setQuantity_Random(int number) =>
      _setInt(STORAGE_KEYS.RANDOM_QUANTITY_KEY.toString(),number);

  //GETS
  DateTime getDataNasc_Cadastro() =>
      DateTime.parse(_getString(STORAGE_KEYS.DATANASC_KEY.toString()));

  List<String> getLinguagemPref_Cadastro() =>
      _getListString(STORAGE_KEYS.LINGUAGEM_KEY.toString());

  double getSalario_Cadastro() =>
      _getDouble(STORAGE_KEYS.SALARIO_KEY.toString());

  String getNome_Cadastro() => _getString(STORAGE_KEYS.NOME_KEY.toString());

  int getExperiencia_Cadastro() => _getInt(STORAGE_KEYS.NOME_KEY.toString());

  String getNivel_Cadastro() => _getString(STORAGE_KEYS.NOME_KEY.toString());

  String getUsuario_Config() => _getString(STORAGE_KEYS.USUARIO_KEY.toString());

  double getAltura_Config() => _getDouble(STORAGE_KEYS.ALTURA_KEY.toString());

  bool? getDarkTheme_Config() => _getBool(STORAGE_KEYS.THEME_KEY.toString());

  bool? getNotification_Config() =>
      _getBool(STORAGE_KEYS.NOTIFICATION_KEY.toString());

  int getRandomNumber_Random() =>
      _getInt(STORAGE_KEYS.RANDOM_NUM_KEY.toString());

  int getQuantity_Random() =>
      _getInt(STORAGE_KEYS.RANDOM_QUANTITY_KEY.toString());
  //METHODS
  Future<bool> _setString(String key, String value) async =>
      await _store.setString(key, value);

  String _getString(String key) => _store.getString(key) ?? "";

  Future<bool> _setInt(String key, int value) async =>
      await _store.setInt(key, value);

  int _getInt(String key) => _store.getInt(key) ?? 0;

  Future<bool> _setDouble(String key, double value) async =>
      await _store.setDouble(key, value);

  double _getDouble(String key) => _store.getDouble(key) ?? 0;

  Future<bool> _setListString(String key, List<String> value) async =>
      await _store.setStringList(key, value);

  List<String> _getListString(String key) => _store.getStringList(key) ?? [];

  Future<bool> _setBool(String key, bool value) async =>
      await _store.setBool(key, value);

  bool? _getBool(String key) => _store.getBool(key);
}
