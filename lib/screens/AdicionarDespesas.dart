import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resgistro_despesas/data/categoria.dart';
import 'package:resgistro_despesas/model/dataModel.dart';
import 'package:resgistro_despesas/providers/despesas_provider.dart';

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
      appBar: AppBar(
        title: const Text('Adicionar Despesa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: descricaoController,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Descrição'),
                ),
                validator: (value) {
                  return 'Validação!';
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
                              const SizedBox(width: 6),
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
                      decoration: const InputDecoration(
                        labelText: 'Categoria',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 120,
                    child: TextFormField(
                      controller: precoController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('Preço'),
                      ),
                      validator: (value) {
                        return 'Validação!';
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    if (descricaoController.text.isNotEmpty &&
                        precoController.text.isNotEmpty &&
                        selectedCategoria != null) {
                      final descricao = descricaoController.text;
                      final preco = double.tryParse(precoController.text) ?? 0.0;
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
                        const SnackBar(content: Text('Despesa adicionada com sucesso!')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Preencha todos os campos!')),
                      );
                    }
                  },
                  child: const Text("Salvar"),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 0, 155, 6),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
