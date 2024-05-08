import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_mvvm/features/pokemon/repository/pokemon_interface.dart';

import 'features/marvel/view/marvel_view.dart';
import 'features/pokemon/view/pokemonlist_page.dart';
import 'features/pokemon/view_model/pokemonlist_viewmodel.dart';
import 'features/pokemon/view_model/state/pokemonlist_state.dart';
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
        ChangeNotifierProvider(create: (_) => PokemonListViewModel(
          pokemonRepo: locator<PokemonRepository>(),
        )),
      ],
      child: Builder(
        builder: (context) {
          return ScreenUtilInit(
            designSize: const Size(360, 640),
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: const PokemonListPage(),
              );
            }
          );
        }
      ),
    );
  }
}


