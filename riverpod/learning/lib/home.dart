import 'package:flutter/material.dart';
import 'package:learning/pages/futureprovider_page.dart';
import 'package:learning/pages/provider_page.dart';
import 'package:learning/pages/stateprovider_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProviderPage(
                              color: Colors.red,
                            )));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(400, 80),
              ),
              child: const Text("Provider"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StateProviderPage(
                              color: Colors.red,
                            )));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(400, 80),
                  backgroundColor: Colors.amber.shade200),
              child: const Text("State Provider"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FutureProviderPage(
                              color: Colors.red,
                            )));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(400, 80),
                  backgroundColor: Colors.black26),
              child: const Text("Future Provider"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(400, 80),
                  backgroundColor: Colors.blueGrey.shade500),
              child: const Text("Stream Provider"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(400, 80), backgroundColor: Colors.blue),
              child: const Text("Change Notifier Provider"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(400, 80),
                  backgroundColor: Colors.orangeAccent),
              child: const Text("State Notifier Provider"),
            )
          ],
        ),
      ),
    );
  }
}
