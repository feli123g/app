import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/custom_widget/drawer_header.dart';
import 'package:flutter_application_1/src/custom_widget/drawer_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Producto en la nube"),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [DrawerEncabezado(), DrawerItem()],
        ),
      ),
    );
  }
}
