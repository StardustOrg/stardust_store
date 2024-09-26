import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart'; // Importando o image_picker
import 'package:logger/logger.dart';
import 'package:stardust_store/utils/constants/colors.dart';
import 'package:stardust_store/utils/constants/sizes.dart';

class PhotocardModal extends StatefulWidget {
  final bool isEditing;
  final Map<String, dynamic>? photocardData;

  PhotocardModal({
    super.key,
    this.isEditing = false,
    this.photocardData,
  });

  @override
  _PhotocardModalState createState() => _PhotocardModalState();
}

class _PhotocardModalState extends State<PhotocardModal> {
  final TextEditingController artistNameController = TextEditingController();
  final TextEditingController pcNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController unitiesController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  List<String> categories = []; // Lista para armazenar as categorias.
  bool isOriginal = false; // Checkbox para indicar se é original.
  File? uploadedImage; // Caminho da imagem carregada.
  final ImagePicker _picker = ImagePicker(); // Instanciando o ImagePicker

  @override
  void initState() {
    super.initState();
    if (widget.isEditing && widget.photocardData != null) {
      // Preenche os controladores com os dados do photocard se estiver editando.
      artistNameController.text = widget.photocardData!['artistName'] ?? '';
      pcNameController.text = widget.photocardData!['pcName'] ?? '';
      priceController.text = widget.photocardData!['price'].toString() ?? '';
      unitiesController.text =
          widget.photocardData!['unities'].toString() ?? '';
      isOriginal = widget.photocardData!['isOriginal'] ?? false;
      categories = List<String>.from(widget.photocardData!['categories'] ?? []);
      uploadedImage = widget.photocardData!['image'];
      print('Imagem carregada para edição: ${uploadedImage?.path}'); // LOG
    }
  }

  void _addCategory() {
    if (categoryController.text.isNotEmpty) {
      setState(() {
        categories.add(categoryController.text);
        print('Categoria adicionada: ${categoryController.text}'); // LOG
        categoryController.clear();
      });
    }
  }

  void _removeCategory(String category) {
    setState(() {
      categories.remove(category);
      print('Categoria removida: $category'); // LOG
    });
  }

  Future<void> _pickImage() async {
    try {
      // Usando o ImagePicker para escolher uma imagem
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          uploadedImage =
              File(pickedFile.path); // Atribuindo a imagem selecionada
        });
        Logger().i('Imagem selecionada: ${pickedFile.name}');
        Logger().i('Caminho da imagem selecionada: ${pickedFile.path}');
      } else {
        Logger().i('Nenhuma imagem selecionada');
      }
    } catch (e) {
      Logger().e('Erro ao selecionar imagem: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: StarColors.bgLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 900.0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.isEditing
                        ? 'Editar Photocard'
                        : 'Cadastrar Photocard',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      print('Fechando o modal'); // LOG
                      Get.back();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Parte da imagem (1/3 da tela)
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('Carregar imagem pressionado'); // LOG
                            _pickImage();
                          },
                          child: Container(
                            width: 280,
                            height: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: StarColors.grey),
                              color: StarColors.bgLight,
                              image: uploadedImage != null
                                  ? DecorationImage(
                                      image: NetworkImage(uploadedImage!
                                          .path), // Alterado para NetworkImage
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: uploadedImage == null
                                ? const Icon(
                                    Icons.upload,
                                    size: 50,
                                    color: StarColors.grey,
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          uploadedImage == null
                              ? 'Carregar Imagem'
                              : 'Alterar Imagem',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  // Parte dos campos (2/3 da tela)
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: pcNameController,
                          decoration: const InputDecoration(
                            labelText: 'Nome do Photocard',
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: artistNameController,
                          decoration: const InputDecoration(
                            labelText: 'Nome do Artista',
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: priceController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Preço',
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextField(
                                controller: unitiesController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Unidades',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Checkbox(
                              value: isOriginal,
                              onChanged: (bool? value) {
                                setState(() {
                                  isOriginal = value!;
                                  print(
                                      'Checkbox original alterado: $isOriginal'); // LOG
                                });
                              },
                            ),
                            const Text('Original'),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextField(
                                controller: categoryController,
                                decoration: InputDecoration(
                                  labelText: 'Categorias',
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      print('Adicionando categoria...'); // LOG
                                      _addCategory();
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8.0,
                          children: categories
                              .map((category) => Chip(
                                    label: Text(category),
                                    onDeleted: () {
                                      print(
                                          'Removendo categoria: $category'); // LOG
                                      _removeCategory(category);
                                    },
                                  ))
                              .toList(),
                        ),
                        const SizedBox(height: 100),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              // Lógica para salvar ou editar o photocard.
                              if (widget.isEditing) {
                                print(
                                    'Salvando alterações no photocard'); // LOG
                                // Ação de editar
                              } else {
                                print('Cadastrando novo photocard'); // LOG
                                // Ação de cadastrar
                              }
                              Get.back(); // Fecha o modal ao salvar.
                            },
                            child: Text(widget.isEditing
                                ? 'Salvar Alterações'
                                : 'Cadastrar Photocard'),
                          ),
                        ),
                      ],
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
}
