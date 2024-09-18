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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'color': color.value,
    };
  }

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      json['id'],
      json['title'],
      Color(json['color']),
    );
  }

  static Categoria fromEnum(Categorias categoria) {
    switch (categoria) {
      case Categorias.comercio:
        return Categoria(0, 'Comércio', Colors.blue);
      case Categorias.carro:
        return Categoria(1, 'Carro', Colors.red);
      case Categorias.casa:
        return Categoria(2, 'Casa', Colors.green);
      case Categorias.transporte:
        return Categoria(3, 'Transporte', Colors.orange);
      case Categorias.saude:
        return Categoria(4, 'Saúde', Colors.purple);
      case Categorias.lazer:
        return Categoria(5, 'Lazer', Colors.yellow);
      default:
        throw Exception('Categoria não reconhecida');
    }
  }
}
