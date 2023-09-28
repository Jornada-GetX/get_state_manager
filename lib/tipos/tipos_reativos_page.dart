import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TiposReativosPage extends StatelessWidget {
  final nome = RxString('Renato Alves');
  final isAluno = RxBool(true);
  final qtdCursos = RxInt(2);
  final valorCurso = RxDouble(1350.00);
  final jornadas = RxList(
    ['Jornada GetX', 'Jornada ADF'],
  );
  final aluno = RxMap({
    'id': 500,
    'nome': 'Renato Alves',
    'tipo': 'Aluno',
  });

  TiposReativosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos Reativos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                debugPrint('Montando id do aluno');
                return Text('Id do aluno: ${aluno['id']}');
              },
            ),
            Obx(() {
              debugPrint('Montando nome do aluno');
              return Text('Nome do aluno: ${aluno['nome']}');
            }),
            Obx(
              () => Column(
                children: jornadas.map(Text.new).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                aluno['id'] = 10;
              },
              child: const Text('Alterar ID'),
            ),
            ElevatedButton(
              onPressed: () {
                // jornadas.add('Jornada Dart.');
                jornadas.assign('Jornada Dart');
              },
              child: const Text('Adicionar jornada'),
            ),
          ],
        ),
      ),
    );
  }
}
