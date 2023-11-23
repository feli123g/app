import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/controller_list.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:flutter_application_1/src/pages/lista_page.dart';
import 'package:flutter_application_1/src/pages/producto_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerList());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/producto', page: () => const ProductoPage()),
        GetPage(name: '/listaProducto', page: () => ListaPage()),
      ],
    );
  }
}
