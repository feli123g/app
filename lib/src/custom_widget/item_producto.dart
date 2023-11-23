import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/controller_list.dart';
import 'package:flutter_application_1/src/models/producto_modelo.dart';
import 'package:get/get.dart';

class ItemProducto extends StatelessWidget {
  final ProductoModelo producto;
  const ItemProducto({
    Key? key,
    required this.producto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const IconData iconoDisponible = Icons.check;
    const IconData iconoNoDisponible = Icons.cancel;
    const Color colorFondoDisponible = Color.fromARGB(255, 244, 216, 54);
    const Color colorFondoNoDisponible = Color.fromARGB(255, 226, 176, 176);

    final IconData selectedIcon =
        producto.disponible ? iconoDisponible : iconoNoDisponible;
    final Color selectedColor =
        producto.disponible ? colorFondoDisponible : colorFondoNoDisponible;
    final ControllerList ctrProducto = Get.find();
    return Card(
      color: selectedColor,
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
            color: Colors.green,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.edit)),
        secondaryBackground: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.delete),
        ),
        onDismissed: ((direction) => {
              if (direction == DismissDirection.endToStart)
                {ctrProducto.delete(producto)}
              else
                {
                  Get.toNamed('producto', arguments: {
                    'id': producto.id,
                    'nombre': producto.nombre,
                    'precio': producto.precio,
                    'disponible': producto.disponible,
                  })
                }
            }),
        child: ListTile(
          title: Text(producto.nombre),
          subtitle: Text(producto.precio.toString()),
        ),
      ),
    );
  }
}
