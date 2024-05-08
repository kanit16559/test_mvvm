
import '../model/pokemon_model.dart';

abstract class PokemonRepository {
  Future<List<PokemonModel>> fetchUser(int params);
}