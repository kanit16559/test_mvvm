
import 'package:get_it/get_it.dart';

import 'features/pokemon/repository/pokemon_interface.dart';
import 'features/pokemon/repository/pokemon_repository.dart';

final GetIt locator = GetIt.instance;

void setUpLocator(){
  locator.registerFactory<PokemonRepository>(() => PokemonRepositoryImpl());
}