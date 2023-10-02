import 'package:get/get.dart';

class TiposReativosEspecificosNulos {
  final nome = Rxn<String>();
  final isAluno = Rxn<bool>(); // => mesmo que RxBool()
  final qtdCursos = Rxn<int>();
  final valorCurso = Rxn<double>();

  void teste() {
    isAluno.toggle();
    isAluno.isFalse;
    isAluno.isTrue;
  }
}
