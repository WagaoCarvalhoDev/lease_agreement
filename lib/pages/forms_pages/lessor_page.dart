import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste/pages/forms_pages/tenant_page.dart';
import 'package:teste/pages/forms_pages/vehicle_page.dart';
import 'package:teste/state/form_lessor_data.dart';
import 'package:teste/widgets/form_lessor_widget.dart';
import 'package:teste/widgets/reactivity_lessor_widget.dart';

class LessorPage extends StatelessWidget {
  final _formLessorKey = GlobalKey<FormState>();

  LessorPage({Key? key}) : super(key: key);

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
              FormLessorWidget(formKey: _formLessorKey),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TenantPage(),
                          ),
                        );
                      },
                      child: const Text('Arrendatário'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VehiclePage(),
                          ),
                        );
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
                      final formData = ref.watch(formLessorDataProvider);
                      return ReactivityLessorWidget(formLessorData: formData);
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
