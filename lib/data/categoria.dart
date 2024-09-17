import 'package:flutter/material.dart';
import 'package:resgistro_despesas/model/dataModel.dart';

const categorias = {
  Categorias.comercio: Categoria(
    'Comercio',
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categorias.casa: Categoria(
    'Casa',
    Color.fromARGB(255, 145, 255, 0),
  ),
  Categorias.carro: Categoria(
    'Carro',
    Color.fromARGB(255, 255, 102, 0),
  ),
  Categorias.lazer: Categoria(
    'Lazer',
    Color.fromARGB(255, 0, 208, 255),
  ),
  Categorias.saude: Categoria(
    'Saúde',
    Color.fromARGB(255, 0, 60, 255),
  ),
  Categorias.transporte: Categoria(
    'Transporte',
    Color.fromARGB(255, 255, 149, 0),
  ),
};