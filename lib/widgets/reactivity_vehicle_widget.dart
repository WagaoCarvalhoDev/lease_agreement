import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste/state/form_vehicle_data.dart';

class ReactivityVehicleWidget extends ConsumerWidget {
  final FormVehicleData formVehicleData;

  const ReactivityVehicleWidget({Key? key, required this.formVehicleData})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Arrendante:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('PLaca: ${formVehicleData.plate ?? ''}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Ano: ${formVehicleData.year ?? ''}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Marca/Modelo: ${formVehicleData.brandModel ?? ''}',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Chassi: ${formVehicleData.chassis ?? ''}',
            ),
          ),
        ],
      ),
    );
  }
}
