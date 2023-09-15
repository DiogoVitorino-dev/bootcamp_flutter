import 'package:hive/hive.dart';

part 'dadosModel.g.dart';

@HiveType(typeId: 0)
class DadosModel extends HiveObject {
  @HiveField(0)
  String _nome = "";

  @HiveField(1)
  DateTime? _dataNasc;

  @HiveField(2)
  String _nivelProg = "";

  @HiveField(3)
  List<String> _linPreferencia = [];

  @HiveField(4)
  int _tempoExp = 0;

  @HiveField(5)
  double _salario = 0;

  DadosModel();
  DadosModel.vazio();
  DadosModel.create(this._nome, this._dataNasc, this._nivelProg, this._linPreferencia,
      this._tempoExp, this._salario);

  String get nome => _nome;
  DateTime? get dataNasc => _dataNasc;
  String get nivelProg => _nivelProg;
  List<String> get linPreferencia => _linPreferencia;
  double get salario => _salario;
  int get tempoExp => _tempoExp;

  set nome(String nome) => _nome = nome;
  set dataNasc(DateTime? dataNasc) => _dataNasc = dataNasc;
  set nivelProg(String nivelProg) => _nivelProg = nivelProg;
  set linPreferencia(List<String> linPreferencia) =>
      _linPreferencia = linPreferencia;
  set salario(double salario) => _salario = salario;
  set tempoExp(int tempoExp) => _tempoExp = tempoExp;
}
