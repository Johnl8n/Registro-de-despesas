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
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
              ),
              const SizedBox(height: 20),
              TextFormField(
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
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Salvar',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _confirmDelete(context, despesasNotifier, widget.despesa.id);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[700],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Apagar',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, despesasNotifier, int despesaId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar exclusão'),
          content: const Text('Tem certeza que deseja excluir essa despesa?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirmar'),
              onPressed: () {
                despesasNotifier.removeDespesa(despesaId);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
