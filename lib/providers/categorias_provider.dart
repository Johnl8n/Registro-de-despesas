import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:resgistro_despesas/model/dataModel.dart';

class CategoriasNotifier extends StateNotifier<List<Categoria>> {
  CategoriasNotifier() : super([]);

  void addCategoria(Categoria categoria) {
    state = [...state, categoria];
  }

  void removeCategoria(String id) {
    state = state.where((categoria) => categoria.id != id).toList();
  }

  List<Categoria> getAllCategorias() {
    return state;
  }
}

final categoriasProvider =
  StateNotifierProvider<CategoriasNotifier, List<Categoria>>((ref) {
    return CategoriasNotifier();

  });