import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste/entity/person.dart';

final formLessorDataProvider =
    ChangeNotifierProvider((ref) => FormLessorData());

class FormLessorData extends ChangeNotifier {
  late String name = '';
  late String cpf = '';
  late String cep = '';
  late String address = '';
  late String location = '';

  void updateData(Person person) {
    name = person.name ?? '';
    cpf = person.cpf ?? '';
    cep = person.cep ?? '';
    address =
        '${person.street ?? ''}, ${person.number ?? ''}, ${person.neighborhood ?? ''},';
    location = '${person.city ?? ''}, ${person.state ?? ''}';
    notifyListeners();
  }
}
