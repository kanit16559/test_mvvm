import 'dart:convert';

import 'package:test_mvvm/features/pokemon/model/poketmon_model.dart';
import 'package:test_mvvm/features/pokemon/repository/poketmon_interface.dart';
import 'package:http/http.dart' as http;

import '../../../utils/constant.dart';


class PoKetMonRepositoryImpl implements PoKetMonRepository {
  @override
  Future<List<PoKetMonModel>> fetchUser() async {
    const pathUrl = "/pokemon?limit=10";

    final resp = await http.get(Uri.parse(Constant.baseUrl + pathUrl));
    final data = json.decode(resp.body);
    final poketmonListInMap = data as List<dynamic>;
    return poketmonListInMap.map((userMap) => PoKetMonModel.fromJson(userMap as Map<String, dynamic>)).toList();
  }

}