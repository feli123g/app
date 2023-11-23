import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controller/controller_list.dart';
import 'package:flutter_application_1/src/models/producto_modelo.dart';
import 'package:flutter_application_1/src/service/producto_service.dart';
import 'package:get/get.dart';

class ControllerProducto extends GetxController {
  String? _id = '';
  var productName = ''.obs;
  var productPrice = ''.obs;
  var productAvailable = true.obs;
  bool fName = false;
  bool fPrice = false;
  RxnString errorName = RxnString(null);
  RxnString errorPrice = RxnString(null);

  Rxn<Function()> submitFunc = Rxn<Function()>(null);

  ProductsService? service;
  ControllerList ctrlst = Get.find();
  var ctrName = TextEditingController().obs;
  var ctrPrice = TextEditingController().obs;

  void setAttributes(String id, String nombre, double precio, bool disponible) {
    _id = id;
    ctrName.value.text = nombre;
    ctrPrice.value.text = precio.toString();
    productName.value = nombre;
    productPrice.value = precio.toString();
    productAvailable.value = disponible;
  }

  @override
  void onInit() {
    super.onInit();
    service = ProductsService();
    debounce<String>(productName, validarName,
        time: const Duration(microseconds: 500));
    debounce<String>(productPrice, validarPrice,
        time: const Duration(microseconds: 500));
  }

  void validarName(String val) {
    errorName.value = null;
    submitFunc.value = null;
    if (val.length > 3) {
      errorName.value = null;
      submitFunc.value = submitFunction();
      fName = true;
    } else {
      errorName.value = 'El nombre debe ser mayor a 3 digitos';
      fName = false;
    }
  }

  void validarPrice(String val) {
    errorPrice.value = null;
    submitFunc.value = null;
    if (double.tryParse(val) is double && double.parse(val) > 10) {
      errorPrice.value = null;
      submitFunc.value = submitFunction();
      fPrice = true;
    } else {
      errorPrice.value = 'Debe ser una cantidad mayor a 10';
      fPrice = false;
    }
  }

  void nameChanged(String val) {
    productName.value = val;
  }

  void priceChanget(String val) {
    productPrice.value = val;
  }

  void availableChanged(bool val) {
    productAvailable.value = val;
  }

  Future<bool> Function() submitFunction() {
    return () async {
      if (!fName || !fPrice) {
        submitFunc.value = null;
        validarName(productName.value);
        validarPrice(productPrice.value);
        return true;
      } else {
        String? mensaje = 'se agrgo un nuevo producto';
        if (_id == '') {
          ProductoModelo producto = ProductoModelo(
              nombre: productName.value,
              precio: double.tryParse(productPrice.value) ?? 0,
              disponible: productAvailable.value);
          _id = await ctrlst.agregar(producto);
        } else {
          ProductoModelo producto = ProductoModelo(
              id: _id,
              nombre: productName.value,
              precio: double.tryParse(productPrice.value) ?? 0,
              disponible: productAvailable.value);
          ctrlst.actualizar(producto);
          mensaje = 'Se actilizo el producto';
          Get.offAllNamed('/listaProducto');
        }
        // ProductoModelo producto = ProductoModelo(
        //     nombre: productName.value,
        //     precio: double.tryParse(productPrice.value) ?? 0,
        //     disponible: productAvailable.value);
        // //service?.createProduct(producto);
        // String? id = await service?.createProduct(producto);
        if (_id!.isNotEmpty) {
          ctrName.value.text = '';
          ctrPrice.value.text = '';
          productAvailable.value = true;
          Get.snackbar('Producto', mensaje);
        }
        return true;
      }
    };
  }
}
