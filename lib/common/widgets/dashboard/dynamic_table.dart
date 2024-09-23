import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stardust_store/utils/constants/colors.dart';

class DynamicDataTable extends StatefulWidget {
  final List<String> columns; // Títulos das colunas
  final List<List<dynamic>> rows; // Dados das linhas

  const DynamicDataTable({
    Key? key,
    required this.columns,
    required this.rows,
  }) : super(key: key);

  @override
  _DynamicDataTableState createState() => _DynamicDataTableState();
}

class _DynamicDataTableState extends State<DynamicDataTable> {
  int? _sortColumnIndex; // Índice da coluna que está sendo ordenada
  bool _isAscending = true; // Direção da ordenação

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: StarColors.starPink.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(8),
        ),
        width:
            MediaQuery.of(context).size.width * 0.77, // 80% da largura da tela
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columnSpacing: 30, // Ajusta o espaçamento entre as colunas
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _isAscending,
            headingRowColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                return StarColors.starPink
                    .withOpacity(0.1); // Cor para a linha do cabeçalho
              },
            ),
            columns: _buildDataColumns(),
            rows: _buildDataRows(),
          ),
        ),
      ),
    );
  }

  // Cria as colunas da DataTable com ícones de ordenação
  List<DataColumn> _buildDataColumns() {
    return widget.columns.asMap().entries.map((entry) {
      int index = entry.key;
      String column = entry.value;
      return DataColumn(
        label: Row(
          children: [
            Text(
              column,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            if (_sortColumnIndex ==
                index) // Mostra o ícone de ordenação se for a coluna ordenada
              Icon(
                _isAscending ? Icons.arrow_upward : Icons.arrow_downward,
                size: 16,
              )
          ],
        ),
        onSort: (columnIndex, ascending) {
          setState(() {
            if (_sortColumnIndex == columnIndex) {
              _isAscending =
                  !_isAscending; // Alterna a direção se for a mesma coluna
            } else {
              _sortColumnIndex = columnIndex;
              _isAscending = ascending;
            }
            _sortRowsByColumnIndex(columnIndex, _isAscending);
          });
        },
      );
    }).toList();
  }

  // Cria as linhas da DataTable com cores alternadas
  List<DataRow> _buildDataRows() {
    return widget.rows.asMap().entries.map((entry) {
      int index = entry.key;
      List<dynamic> row = entry.value;
      return DataRow(
        color: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            // Alterna a cor das linhas
            return StarColors.bgLight;
          },
        ),
        cells: row.map((cell) {
          return DataCell(
            Container(
              width: MediaQuery.of(context).size.width *
                  0.8 /
                  widget.columns.length,
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              child: Text(
                cell.toString(),
                overflow: TextOverflow.ellipsis, // Evita overflow com elipses
              ),
            ),
          );
        }).toList(),
      );
    }).toList();
  }

  // Ordena as linhas de acordo com a coluna clicada
  void _sortRowsByColumnIndex(int columnIndex, bool ascending) {
    widget.rows.sort((a, b) {
      final aValue = a[columnIndex];
      final bValue = b[columnIndex];
      return _compareValues(aValue, bValue, ascending);
    });
  }

  // Função que compara valores considerando diferentes tipos de dados
  int _compareValues(dynamic a, dynamic b, bool ascending) {
    int result;

    if (a is num && b is num) {
      result = a.compareTo(b);
    } else if (_isDate(a) && _isDate(b)) {
      result = _parseDate(a).compareTo(_parseDate(b));
    } else {
      result = a.toString().compareTo(b.toString());
    }

    return ascending ? result : -result;
  }

  // Verifica se o valor é uma data válida
  bool _isDate(dynamic value) {
    try {
      _parseDate(value);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Converte uma string para DateTime
  DateTime _parseDate(dynamic value) {
    return DateFormat('yyyy-MM-dd').parse(value.toString());
  }
}
