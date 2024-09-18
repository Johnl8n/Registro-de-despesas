import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resgistro_despesas/model/despesaModel.dart';
import 'package:resgistro_despesas/providers/despesas_provider.dart';

class DetalhesDespesa extends ConsumerStatefulWidget {
  final Despesa despesa;

  DetalhesDespesa({required this.despesa, super.key});

  @override
  _DetalhesDespesaState createState() => _DetalhesDespesaState();
}

class _DetalhesDespesaState extends ConsumerState<DetalhesDespesa> {
  late TextEditingController descricaoController;
  late TextEditingController precoController;

  @override
  void initState() {
    super.initState();
    descricaoController = TextEditingController(text: widget.despesa.descricao);
    precoController = TextEditingController(text: widget.despesa.preco.toString());
  }

  @override
  Widget build(BuildContext context) {
    final despesasNotifier = ref.read(despesaProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Despesa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: precoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Preço'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                despesasNotifier.removeDespesa(widget.despesa.id);
                despesasNotifier.addDespesa(
                  descricaoController.text,
                  widget.despesa.categoria,
                  double.tryParse(precoController.text) ?? widget.despesa.preco,
                );
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
