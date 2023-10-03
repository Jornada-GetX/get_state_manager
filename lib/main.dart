import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/basico/reatividade_page.dart';
import 'package:get_state_manager/home_page.dart';
import 'package:get_state_manager/tipos/tipos_obs_page.dart';
import 'package:get_state_manager/tipos/tipos_reativos_genericos_page.dart';
import 'package:get_state_manager/tipos/tipos_reativos_page.dart';

import 'tipos/tipos_reativos_genericos_nulos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/basico',
          page: () => ReatividadePage(),
        ),
        GetPage(
          name: '/tiposReativos',
          page: () => TiposReativosPage(),
        ),
        GetPage(
          name: '/tiposReativosGenericos',
          page: () => TiposReativosGenericosPage(),
        ),
        GetPage(
          name: '/tiposReativosGenericosNulos',
          page: () => TiposReativosGenericosNulosPage(),
        ),
        GetPage(
          name: '/tiposObs',
          page: () => TiposObsPage(),
        ),
      ],
    );
  }
}
