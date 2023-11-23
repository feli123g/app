import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Lista de producto'),
          onTap: () => Get.offNamed('listaProducto'),
        ),
        ListTile(
          title: const Text('Nuevo producto'),
          onTap: () => Get.offNamed('producto'),
        )
      ],
    );
  }
}
