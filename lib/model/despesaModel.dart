import 'package:resgistro_despesas/model/dataModel.dart';

class Despesa {
  const Despesa(this.id, this.descricao, this.categoria, this.preco);

  final int id;
  final String descricao;
  final Categoria categoria;
  final double preco;
}
