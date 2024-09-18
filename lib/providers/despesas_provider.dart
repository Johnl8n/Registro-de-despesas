import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:resgistro_despesas/model/dataModel.dart';
import 'package:resgistro_despesas/model/despesaModel.dart';

class DespesasNotifier extends StateNotifier<List<Despesa>> {
  DespesasNotifier() : super([]) {
    _loadDespesas();
  }

  Future<void> addDespesa(String descricao, Categoria categoria, double preco) async {
    final id = DateTime.now().millisecondsSinceEpoch;
    final novaDespesa = Despesa(
      id: id,
      descricao: descricao,
      categoria: categoria,
      preco: preco,
    );
    state = [...state, novaDespesa];
    await _saveDespesas(); 
  }

  Future<void> removeDespesa(int id) async {
    state = state.where((despesa) => despesa.id != id).toList();
    await _saveDespesas();
  }

  Future<void> _saveDespesas() async {
    final prefs = await SharedPreferences.getInstance();
    final despesasJson = state.map((despesa) => despesa.toJson()).toList();
    prefs.setString('despesas', jsonEncode(despesasJson));
  }

  Future<void> _loadDespesas() async {
    final prefs = await SharedPreferences.getInstance();
    final despesasString = prefs.getString('despesas');
    if (despesasString != null) {
      final despesasJson = jsonDecode(despesasString) as List;
      state = despesasJson.map((json) => Despesa.fromJson(json)).toList();
    }
  }
}

final despesaProvider =
StateNotifierProvider<DespesasNotifier, List<Despesa>>((ref) {
  return DespesasNotifier();
});
