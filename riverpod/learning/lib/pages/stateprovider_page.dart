import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final valueStateProvider = StateProvider<int>((ref) => 42);
//NOTE: reset the value when you exit the widget
final valueStateProvider = StateProvider.autoDispose<int>((ref) => 42);

class StateProviderPage extends ConsumerWidget {
  final Color color;

  const StateProviderPage({super.key, required this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //NOTE: Effectuer une action en fonction de l'etat du provider
    ref.listen<int>(valueStateProvider, (previous, next) {
      print('value State provider: $previous -> $next');
      if (next == 44) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Value = 44')));
      }
    });
    final value = ref.watch(valueStateProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade200,
          title: const Text("STATE PROVIDER"),
        ),
        body: Center(
            child: Column(
          children: [
            Text(
              'The value is ${ref.watch(valueStateProvider)}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => ref.read(valueStateProvider.notifier).state++,
                child: const Text("Increment")),
            ElevatedButton(
                onPressed: () => ref.invalidate(valueStateProvider),
                child: const Text("Invalidate"))
          ],
        )));
  }
}
