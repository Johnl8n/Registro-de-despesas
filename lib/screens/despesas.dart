import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resgistro_despesas/providers/despesas_provider.dart';
import 'package:resgistro_despesas/screens/detalhesDespesa.dart';

class DespesasLista extends ConsumerWidget {
  const DespesasLista({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final despesas = ref.watch(despesaProvider);

    final totalGastos = despesas.fold(0.0, (sum, despesa) => sum + despesa.preco);

    return Scaffold(
      body: despesas.isEmpty
          ? const Center(
              child: Text(
                'Nenhuma despesa cadastrada.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: despesas.length,
                      itemBuilder: (context, index) {
                        final despesa = despesas[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetalhesDespesa(despesa: despesa),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: despesa.categoria.color,
                                  child: Icon(Icons.category, color: Colors.white),
                                ),
                                title: Text(
                                  despesa.descricao,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  'Categoria: ${despesa.categoria.title}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                trailing: Text(
                                  'R\$ ${despesa.preco.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.green[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total de Gastos:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'R\$ ${totalGastos.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
