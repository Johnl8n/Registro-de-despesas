import 'package:flutter/material.dart';

enum Categorias {
  comercio,
  carro,
  casa,
  transporte,
  saude,
  lazer,
}

class Categoria {
  const Categoria(this.id, this.title, this.color);

  final int id;
  final String title;
  final Color color;
}