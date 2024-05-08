import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mvvm/features/pokemon/repository/poketmon_interface.dart';

import 'features/marvel/view/marvel_view.dart';
import 'features/pokemon/view/poketmonlist_page.dart';
import 'features/pokemon/view_model/poketmonlist_viewmodel.dart';
import 'features/pokemon/view_model/state/poketmonlist_state.dart';
import 'locator.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PoKetMonListViewModel(
          poKetMonRepo: locator<PoKetMonRepository>(),
        )),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const PoKetMonListPage(),
          );
        }
      ),
    );
  }
}


