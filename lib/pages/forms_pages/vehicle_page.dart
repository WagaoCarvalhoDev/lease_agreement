import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste/state/form_vehicle_data.dart';
import 'package:teste/widgets/form_vehicle_widget.dart';
import 'package:teste/widgets/reactivity_vehicle_widget.dart';

class VehiclePage extends StatelessWidget {
  final _formVehicleKey = GlobalKey<FormState>();

  VehiclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contrato de arrendamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormVehicleWidget(formKey: _formVehicleKey),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Início'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formVehicleKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Formulário enviado com sucesso!'),
                            ),
                          );
                        }
                      },
                      child: const Text('Arrendatário'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formVehicleKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Formulário enviado com sucesso!'),
                            ),
                          );
                        }
                      },
                      child: const Text('Veículo'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Consumer(
                    builder: (context, ref, _) {
                      final formData = ref.watch(formVehicleDataProvider);
                      return ReactivityVehicleWidget(formVehicleData: formData);
                    },
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
