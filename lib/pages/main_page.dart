import 'package:flutter/material.dart';
import 'package:teste/pages/forms_pages/lessor_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            ElevatedButton(
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20))),
              child: const Text('Enviar'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LessorPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
