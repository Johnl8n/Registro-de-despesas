import 'package:flutter/material.dart';
import 'package:resgistro_despesas/data/categoria.dart';

class AdicionarDespesas extends StatefulWidget {
  const AdicionarDespesas({super.key});

  @override
  State<AdicionarDespesas> createState() => _AdicionarDespesasState();
}

class _AdicionarDespesasState extends State<AdicionarDespesas> {
  void _onBackPressed(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
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
                    child: DropdownButtonFormField(
                      items: [
                        for (final categoria in categorias.entries)
                          DropdownMenuItem(
                            value: categoria.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: categoria.value.color,
                                ),
                                const SizedBox(width: 6),
                                Text(categoria.value.title),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        labelText: 'Categoria',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 120,
                    child: TextFormField(
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
                child: Container(
                  child: TextButton(
                    onPressed: () {
                    },
                    child: const Text("Salvar"),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 0, 155, 6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
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
