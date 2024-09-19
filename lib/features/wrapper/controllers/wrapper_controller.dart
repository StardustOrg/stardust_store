import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stardust_store/features/dashboard/dashboard.dart';
import 'package:stardust_store/features/products/products.dart';
import 'package:stardust_store/features/sells/sells.dart';
import 'package:stardust_store/features/settings/settings.dart';

// Controlador para gerenciar o estado de seleção da página
class WrapperController extends ChangeNotifier {
  int _selectedIndex = 0;

  // Lista de páginas para navegação
  final List<Widget> _pages = [
    Dashboard(),
    Sells(),
    Products(),
    Settings(),
  ];

  // Obter o índice da página selecionada
  int get selectedIndex => _selectedIndex;

  // Obter a página selecionada
  Widget get selectedPage => _pages[_selectedIndex];

  // Método para alterar a página selecionada
  void selectPage(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
