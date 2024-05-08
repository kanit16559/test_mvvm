
import 'package:get_it/get_it.dart';

import 'features/pokemon/repository/poketmon_interface.dart';
import 'features/pokemon/repository/poketmon_repository.dart';

final GetIt locator = GetIt.instance;

void setUpLocator(){
  locator.registerFactory<PoKetMonRepository>(() => PoKetMonRepositoryImpl());
}