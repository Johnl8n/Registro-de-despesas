import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resgistro_despesas/data/categoria.dart';
import 'package:resgistro_despesas/model/dataModel.dart';
import 'package:resgistro_despesas/providers/despesas_provider.dart';
import 'package:resgistro_despesas/screens/home.dart';

class AdicionarDespesas extends ConsumerStatefulWidget {
  const AdicionarDespesas({super.key});

  @override
  _AdicionarDespesasState createState() => _AdicionarDespesasState();
}

class _AdicionarDespesasState extends ConsumerState<AdicionarDespesas> {
  final descricaoController = TextEditingController();
  final precoController = TextEditingController();
  Categoria? selectedCategoria;

  void _onBackPressed(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final despesasNotifier = ref.read(despesaProvider.notifier);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: descricaoController,
                  maxLength: 50,
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  validator: (value) {
                    return value == null || value.isEmpty ? 'Campo obrigatório' : null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<Categoria>(
                        value: selectedCategoria,
                        items: categorias.entries.map((entry) {
                          final categoria = entry.value;
                          return DropdownMenuItem<Categoria>(
                            value: categoria,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: categoria.color,
                                ),
                                const SizedBox(width: 8),
                                Text(categoria.title),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategoria = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Categoria',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 120,
                      child: TextFormField(
                        controller: precoController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Preço',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        validator: (value) {
                          return value == null || value.isEmpty
                              ? 'Campo obrigatório'
                              : null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (descricaoController.text.isNotEmpty &&
                          precoController.text.isNotEmpty &&
                          selectedCategoria != null) {
                        final descricao = descricaoController.text;
                        final preco =
                            double.tryParse(precoController.text) ?? 0.0;
                        despesasNotifier.addDespesa(
                          descricao,
                          selectedCategoria!,
                          preco,
                        );

                        descricaoController.clear();
                        precoController.clear();
                        setState(() {
                          selectedCategoria = null;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Despesa adicionada com sucesso!'),
                          ),
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Preencha todos os campos!'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 155, 6),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                    ),
                    child: const Text(
                      "Salvar",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
