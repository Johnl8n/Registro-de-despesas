import 'package:flutter/material.dart';
import 'package:resgistro_despesas/screens/AdicionarDespesas.dart';
import 'package:resgistro_despesas/screens/despesas.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPageIndex = 0;

  void _selecionarPaginas(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget ativarPagina = const DespesasLista();
    var tituloPagina = 'Despesas';

    if (_selectedPageIndex == 1) {
      ativarPagina = const AdicionarDespesas();
      tituloPagina = 'Adicionar Despesas';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(tituloPagina),
        backgroundColor: Colors.green,

      ),
      body: ativarPagina,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selecionarPaginas,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Despesas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Adicionar',
          ),
        ],
      ),
    );
  }
}
