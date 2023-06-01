import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste/state/form_tenant_data.dart';

class ReactivityTenantWidget extends ConsumerWidget {
  final FormTenantData formTenantData;

  const ReactivityTenantWidget({Key? key, required this.formTenantData})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Arrendatario:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Nome: ${formTenantData.name ?? ''}'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('CPF: ${formTenantData.cpf ?? ''}'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Endereço: ${formTenantData.address ?? ''}',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Local: ${formTenantData.location ?? ''}',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(''
              'CEP: ${formTenantData.cep ?? ''}'),
        ),
      ],
    );
  }
}
