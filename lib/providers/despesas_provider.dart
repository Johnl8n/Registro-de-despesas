import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:resgistro_despesas/model/despesaModel.dart';

class DespesasNotifier extends StateNotifier<List<Despesa>> {
  DespesasNotifier() : super([]);

  void addDespesa(Despesa despesa) {
    state = [...state, despesa];
  }

  void removeDespesa(int id) {
    state = state.where((despesa) => despesa.id != id).toList();
  }

  List<Despesa> getAllDespesas() {
    return state;
  }
}

final despesaProvider =
StateNotifierProvider<DespesasNotifier, List<Despesa>>((ref) {
  return DespesasNotifier();
});