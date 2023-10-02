import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/tipos/model/aluno.dart';

class TiposReativosGenericosPage extends StatelessWidget {
  final nome = Rx<String>('Renato Alves');
  final isAluno = Rx<bool>(true);
  final qtdCursos = Rx<int>(2);
  final valorCurso = Rx<double>(1350.00);
  final jornadas = Rx<List<String>>(
    ['Jornada GetX', 'Jornada ADF'],
  );
  final aluno = Rx<Map<String, dynamic>>({
    'id': 500,
    'nome': 'Renato Alves',
    'tipo': 'Aluno',
  });
  var alunoModel = Rx<Aluno>(
    Aluno(
      id: 1,
      nome: 'Renato',
      email: 'renatorv@gmail.com',
      curso: 'Jornada GetX',
    ),
  );

  TiposReativosGenericosPage({super.key});

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
                return Text('Id do aluno: ${aluno.value['id']}');
              },
            ),
            Obx(() {
              debugPrint('Montando nome do aluno');
              return Text('Nome do aluno: ${aluno.value['nome']}');
            }),
            Obx(
              () => Column(
                children: jornadas.value.map(Text.new).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                aluno.value['id'] = 10;
                // Necessário o refresh nessa abordagem
                aluno.refresh();
              },
              child: const Text('Alterar ID'),
            ),
            ElevatedButton(
              onPressed: () {
                // jornadas.value.add('Jornada Dart.');
                // assign: remove elementos da lista atualiza com os novos elementos.
                jornadas.value.assign('Jornada Dart');
                // Necessário o refresh nessa abordagem
                jornadas.refresh();
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
