import 'package:flutter/material.dart';
import 'package:test_mvvm/features/pokemon/view_model/state/pokemonlist_state.dart';
import '../model/pokemon_model.dart';
import '../repository/pokemon_interface.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PokemonListViewModel extends ChangeNotifier {
  final PokemonRepository pokemonRepo;

  PokemonListViewModel({
    required this.pokemonRepo,
  }) {
    initState();
  }

  PokemonListState get state => _state;

  late PokemonListState _state;

  RefreshController get refreshController => _refreshController;

  final RefreshController _refreshController = RefreshController();

  final int _offSet = 21;

  void initState(){
    _state = PokemonListState(
      offset: 0,
    );
  }

  Future<void> fetchData({bool isNewFetch = false}) async {
    if(isNewFetch == true){
      _state = _state.copyWith(
        status: AppPokemonListStatus.loading,
        value: [],
        offset: 0
      );
      notifyListeners();
    }

    try{
      final response = await pokemonRepo.fetchUser(_state.offset);

      if(response is Exception){
        _state = _state.copyWith(status: AppPokemonListStatus.failure);
        return;
      }
      List<PokemonModel>? listValue = [];
      if(_state.value == null || _state.value!.isEmpty){
        listValue = List.from(response);
      }else{
        listValue.addAll(_state.value!);
        listValue.addAll(response);
      }

      _state = _state.copyWith(
        status: AppPokemonListStatus.success,
        offset: response.isEmpty ? _state.offset : _state.offset + _offSet,
        value: listValue,
      );
    }catch(error){
      _state = _state.copyWith(status: AppPokemonListStatus.failure);
    }
    notifyListeners();
  }

  void onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    await fetchData(isNewFetch: true);
    _refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    await fetchData();
    _refreshController.loadComplete();
  }

}