import 'package:flutter/material.dart';
import 'package:resgistro_despesas/data/categoria.dart';

class AdicionarDespesas extends StatefulWidget {
  const AdicionarDespesas({super.key});

  @override
  State<AdicionarDespesas> createState() => _AdicionarDespesasState();
}

class _AdicionarDespesasState extends State<AdicionarDespesas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  return 'Validação!';
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Quantidade'),
                    ),
                    initialValue: '1',
                  ),),
                  const SizedBox(width: 8,),
                  Expanded(child: DropdownButtonFormField(items: [
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
                            ]
                          )
                      )
                  ], onChanged: (value) {}),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}