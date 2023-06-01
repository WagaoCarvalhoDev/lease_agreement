import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste/entity/vehicle.dart';
import 'package:teste/state/form_vehicle_data.dart';

class FormVehicleWidget extends ConsumerWidget {
  final GlobalKey<FormState> formKey;

  const FormVehicleWidget({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plateController = TextEditingController();
    final yearController = TextEditingController();
    final brandModelController = TextEditingController();
    final chassisController = TextEditingController();

    return Form(
      key: formKey,
      onChanged: () {
        final formData = ref.read(formVehicleDataProvider);
        final person = Vehicle(
          plate: plateController.text,
          year: yearController.text,
          brandModel: brandModelController.text,
          chassis: chassisController.text,
        );
        formData.updateData(person);
      },
      child: Column(
        children: <Widget>[
          Text(
            "Veículo:",
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
              controller: plateController,
              decoration: const InputDecoration(
                labelText: 'Placa',
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
              controller: yearController,
              decoration: const InputDecoration(
                labelText: 'Ano Fabricação',
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
                    controller: brandModelController,
                    decoration: const InputDecoration(
                      labelText: 'Marca/Modelo',
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
                    controller: chassisController,
                    decoration: const InputDecoration(
                      labelText: 'Chassi',
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
            ],
          ),
        ],
      ),
    );
  }
}
