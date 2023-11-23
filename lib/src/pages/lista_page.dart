import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/controller_list.dart';
import 'package:flutter_application_1/src/custom_widget/drawer_header.dart';
import 'package:flutter_application_1/src/custom_widget/drawer_items.dart';
import 'package:flutter_application_1/src/custom_widget/item_producto.dart';
import 'package:get/get.dart';

class ListaPage extends StatelessWidget {
  ListaPage({super.key});
  final ControllerList ctr = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de productos'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerEncabezado(),
            DrawerItem(),
          ],
        ),
      ),
      body: Obx(() => ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: ctr.listaProducto.length,
            itemBuilder: (BuildContext context, int index) {
              var producto = ctr.listaProducto[index];
              return ItemProducto(producto: producto);
            },
          )),
    );
  }
}
