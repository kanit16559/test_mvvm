import 'package:flutter/material.dart';

class MarvelView extends StatefulWidget {
  const MarvelView({super.key});

  @override
  State<MarvelView> createState() => _MarvelViewState();
}

class _MarvelViewState extends State<MarvelView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("MarvelView"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '55555',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
