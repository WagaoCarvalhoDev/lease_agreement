import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste/state/form_tenant_data.dart';
import 'package:teste/widgets/form_tenant_widget.dart';
import 'package:teste/widgets/reactivity_tenant_widget.dart';

class TenantPage extends StatelessWidget {
  final _formTenantKey = GlobalKey<FormState>();

  TenantPage({Key? key}) : super(key: key);

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
              FormTenantWidget(formKey: _formTenantKey),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formTenantKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Formulário enviado com sucesso!'),
                      ),
                    );
                  }
                },
                child: const Text('Enviar'),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Consumer(
                    builder: (context, ref, _) {
                      final formData = ref.watch(formTenantDataProvider);
                      return ReactivityTenantWidget(formTenantData: formData);
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
