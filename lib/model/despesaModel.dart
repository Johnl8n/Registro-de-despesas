import 'package:resgistro_despesas/model/dataModel.dart';

class Despesa {
  final int id;
  final String descricao;
  final Categoria categoria;
  final double preco;

  Despesa({
    required this.id,
    required this.descricao,
    required this.categoria,
    required this.preco,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descricao': descricao,
      'categoria': categoria.toJson(),
      'preco': preco,
    };
  }


  factory Despesa.fromJson(Map<String, dynamic> json) {
    return Despesa(
      id: json['id'],
      descricao: json['descricao'],
      categoria: Categoria.fromJson(json['categoria']),
      preco: json['preco'],
    );
  }
}
