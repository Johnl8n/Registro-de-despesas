import 'package:flutter/material.dart';
import 'package:resgistro_despesas/model/dataModel.dart';

const categorias = {
  Categorias.comercio: Categoria(
    1,
    'Comercio',
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categorias.casa: Categoria(
    2,
    'Casa',
    Color.fromARGB(255, 145, 255, 0),
  ),
  Categorias.carro: Categoria(
    3,
    'Carro',
    Color.fromARGB(255, 255, 102, 0),
  ),
  Categorias.lazer: Categoria(
    4,
    'Lazer',
    Color.fromARGB(255, 0, 208, 255),
  ),
  Categorias.saude: Categoria(
    5,
    'Saúde',
    Color.fromARGB(255, 0, 60, 255),
  ),
  Categorias.transporte: Categoria(
    6,
    'Transporte',
    Color.fromARGB(255, 255, 149, 0),
  ),
};