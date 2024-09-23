import 'package:flutter/material.dart';
import 'package:stardust_store/utils/constants/colors.dart';

class FilterWidget extends StatefulWidget {
  final String filterName; // Nome do filtro, ex: 'Artista'
  final List<dynamic>
      filterOptions; // Opções do filtro, ex: ['Artista 1', 'Artista 2', ...]
  final bool isNumeric; // Se o filtro é numérico (usará RangeSlider)

  const FilterWidget({
    Key? key,
    required this.filterName,
    required this.filterOptions,
    this.isNumeric = false, // Se true, usa RangeSlider
  }) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  List<dynamic> selectedValues = []; // Valores selecionados
  RangeValues _currentRangeValues =
      const RangeValues(0, 100); // Para valores numéricos
  String? selectedValue; // Valor selecionado no dropdown

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showFilterDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: StarColors.bgLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: StarColors.bgLight),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.filterName,
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: StarColors.starPink,
            ),
          ],
        ),
      ),
    );
  }

  // Exibe o diálogo de filtro
  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Filtrar por ${widget.filterName}'),
          content:
              widget.isNumeric ? _buildRangeSlider() : _buildCheckboxList(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  // Constrói a lista de checkboxes para seleção de filtros
  Widget _buildCheckboxList() {
    return SingleChildScrollView(
      child: Column(
        children: widget.filterOptions.map((option) {
          return CheckboxListTile(
            title: Text(option.toString()),
            value: selectedValues.contains(option),
            onChanged: (isChecked) {
              setState(() {
                isChecked == true
                    ? selectedValues.add(option)
                    : selectedValues.remove(option);
              });
            },
          );
        }).toList(),
      ),
    );
  }

  // Constrói o slider para valores numéricos
  Widget _buildRangeSlider() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RangeSlider(
          values: _currentRangeValues,
          min: 0,
          max: 100,
          divisions: 10,
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        ),
        Text(
            'Selecionado: ${_currentRangeValues.start.round()} - ${_currentRangeValues.end.round()}'),
      ],
    );
  }
}
