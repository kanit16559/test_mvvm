import 'package:flutter/material.dart';
import 'package:test_mvvm/features/pokemon/view_model/state/poketmonlist_state.dart';
import '../repository/poketmon_interface.dart';

class PoKetMonListViewModel extends ChangeNotifier {
  final PoKetMonRepository poKetMonRepo;

  PoKetMonListViewModel({
    required this.poKetMonRepo,
  });

  PoKetMonListState state = PoKetMonListState();

  Future<void> fetchData() async {
    state = state.copyWith(status: AppPoKetMonListStatus.failure);
    try{
      final response = await poKetMonRepo.fetchUser();

      if(response is Exception){
        state = state.copyWith(status: AppPoKetMonListStatus.failure);
      }

    }catch(error){
      state = state.copyWith(status: AppPoKetMonListStatus.failure);
    }
    notifyListeners();
  }

}