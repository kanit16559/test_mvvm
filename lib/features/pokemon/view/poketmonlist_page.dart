
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/poketmonlist_viewmodel.dart';

class PoKetMonListPage extends StatefulWidget {
  const PoKetMonListPage({super.key});

  @override
  State<PoKetMonListPage> createState() => _PoKetMonListPageState();
}

class _PoKetMonListPageState extends State<PoKetMonListPage> {

  late PoKetMonListViewModel viewModel;

  @override
  void initState() {
    viewModel = context.read<PoKetMonListViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('==== 000000');
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
              '66666',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
