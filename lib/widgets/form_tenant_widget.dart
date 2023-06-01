import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste/entity/person.dart';
import 'package:teste/state/form_tenant_data.dart';

class FormTenantWidget extends ConsumerWidget {
  final GlobalKey<FormState> formKey;

  const FormTenantWidget({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final cpfController = TextEditingController();
    final cepController = TextEditingController();
    final streetController = TextEditingController();
    final numberController = TextEditingController();
    final neighborhoodController = TextEditingController();
    final cityController = TextEditingController();
    final stateController = TextEditingController();

    return Form(
      key: formKey,
      onChanged: () {
        final formData = ref.read(formTenantDataProvider);
        final person = Person(
          name: nameController.text,
          cpf: cpfController.text,
          cep: cepController.text,
          street: streetController.text,
          number: numberController.text,
          neighborhood: neighborhoodController.text,
          city: cityController.text,
          state: stateController.text,
        );
        formData.updateData(person);
      },
      child: Column(
        children: <Widget>[
          Text(
            "Arrenatário - Titular do RNTRC(ANTT):",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: -1,
              color: Colors.grey[800],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
              //maxLength: 43,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name.';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: cpfController,
              decoration: const InputDecoration(
                labelText: 'CPF',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a CPF.';
                }
                return null;
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: cepController,
                    decoration: const InputDecoration(
                      labelText: 'CEP',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a neighborhood.';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: cityController,
                    decoration: const InputDecoration(
                      labelText: 'Cidade',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a city.';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: stateController,
                    decoration: const InputDecoration(
                      labelText: 'UF',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a state.';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: streetController,
              decoration: const InputDecoration(
                hintMaxLines: 2,
                labelText: 'Rua',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a street.';
                }
                return null;
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: neighborhoodController,
                    decoration: const InputDecoration(
                      hintMaxLines: 2,
                      labelText: 'Bairro',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a street.';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: numberController,
                    decoration: const InputDecoration(
                      labelText: 'Número',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number.';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
