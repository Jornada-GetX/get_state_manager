import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/atualizacao/usuario_model.dart';

class AtualizacaoObjetosPage extends StatelessWidget {
  AtualizacaoObjetosPage({Key? key}) : super(key: key);

  final usuarioModel = UsuarioModel(id: 1, nome: 'Renato', email: 'renatorv@gmail.com').obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atualização de objetos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text(usuarioModel.value.id.toString());
            }),
            Obx(() {
              return Text(usuarioModel.value.nome);
            }),
            Obx(() {
              return Text(usuarioModel.value.email);
            }),
            ElevatedButton(
              onPressed: () {
                usuarioModel.value.nome = 'Neide Siqueira';
                usuarioModel.refresh();
              },
              child: const Text('Atualizando com refresh'),
            ),
            ElevatedButton(
              onPressed: () {
                // Design Pattern Prototype
                // Estamos criando um novo objeto
                usuarioModel.value = usuarioModel.value.copyWith(nome: 'Neide CopyWith');
              },
              child: const Text('Atualizando com Copy With'),
            ),
            ElevatedButton(
              onPressed: () {
                usuarioModel.update((usu) {
                  usu?.nome = 'Neide com update';
                });
              },
              child: const Text('Atualizando com Update'),
            ),
          ],
        ),
      ),
    );
  }
}
