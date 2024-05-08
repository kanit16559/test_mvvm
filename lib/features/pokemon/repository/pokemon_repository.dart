import 'package:dio/dio.dart';
import 'package:test_mvvm/features/pokemon/model/pokemon_model.dart';
import 'package:test_mvvm/features/pokemon/repository/pokemon_interface.dart';

import '../../../utils/constant.dart';


class PokemonRepositoryImpl implements PokemonRepository {
  @override
  Future<List<PokemonModel>> fetchUser(int params) async {
    const pathUrl = "/pokemon?limit=21";

    final dio = Dio();
    final response = await dio.get("${Constant.baseUrl}$pathUrl&offset=$params");

    final pokemonListInMap = response.data["results"] as List<dynamic>;
    return pokemonListInMap.map((userMap) => PokemonModel.fromJson(userMap as Map<String, dynamic>)).toList();

    // final resp = await http.get(Uri.parse("${Constant.baseUrl}$pathUrl&offset=$params"));
    // final data = json.decode(resp.body);
    // final pokemonListInMap = data["results"] as List<dynamic>;
    // return pokemonListInMap.map((userMap) => PokemonModel.fromJson(userMap as Map<String, dynamic>)).toList();
  }

}