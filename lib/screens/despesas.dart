import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resgistro_despesas/providers/despesas_provider.dart';

class DespesasLista extends ConsumerWidget {
  const DespesasLista({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final despesas = ref.watch(despesaProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Cadastradas'),
      ),
      body: despesas.isEmpty
          ? const Center(child: Text('Nenhuma despesa cadastrada.'))
          : ListView.builder(
              itemCount: despesas.length,
              itemBuilder: (context, index) {
                final despesa = despesas[index];
                return ListTile(
                  title: Text(despesa.descricao),
                  subtitle: Text('Categoria: ${despesa.categoria.title}'),
                  trailing: Text('R\$ ${despesa.preco.toStringAsFixed(2)}'),
                );
              },
            ),
    );
  }
}
