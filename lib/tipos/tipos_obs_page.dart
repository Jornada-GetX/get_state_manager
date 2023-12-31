import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/tipos/model/aluno.dart';

class TiposObsPage extends StatelessWidget {
  final nome = 'Renato Alves'.obs;
  final isAluno = true.obs;
  final qtdCursos = 2.obs;
  final valorCurso = 1350.00.obs;
  final jornadas = ['Jornada GetX', 'Jornada ADF'].obs;
  final aluno = {
    'id': 500,
    'nome': 'Renato Alves',
    'tipo': 'Aluno',
  }.obs;
  final alunoModel = Aluno(
    id: 1,
    nome: 'Renato',
    email: 'renatorv@gmail.com',
    curso: 'Jornada GetX',
  ).obs;

  TiposObsPage({super.key});

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
                debugPrint('Montando id do aluno Model');
                return Text('Id do aluno Model: ${alunoModel.value.id}');
              },
            ),
            Obx(() {
              debugPrint('Montando nome do aluno Model');
              return Text('Nome do aluno Model: ${alunoModel.value.nome}');
            }),
            //
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
                // jornadas.value.add('Jornada Dart.');
                // assign: remove elementos da lista atualiza com os novos elementos.
                jornadas.assign('Jornada Dart');

              },
              child: const Text('Adicionar jornada'),
            ),

            ElevatedButton(
              onPressed: () {
                // alunoModel.value = Aluno(
                //   id: 99,
                //   nome: 'Neuza Maria',
                //   curso: 'Jornada ADF',
                //   email: 'neuzarv@gmail.com',
                // );
                // OU PODE-SE ATUALIZAR UTILIZANDO A CALLABLE CLASS
                alunoModel(
                  Aluno(
                    id: 99,
                    nome: 'Neuza Maria',
                    curso: 'Jornada ADF',
                    email: 'neuzarv@gmail.com',
                  ),
                );
                // Necessário o refresh nessa abordagem
                aluno.refresh();
              },
              child: const Text('Alterar dados aluno model'),
            ),
          ],
        ),
      ),
    );
  }
}
