
import '../../model/poketmon_model.dart';

enum AppPoKetMonListStatus { initial, loading, success, failure }

class PoKetMonListState {
  AppPoKetMonListStatus status;
  List<PoKetMonModel>? value;

  PoKetMonListState({
    this.status = AppPoKetMonListStatus.initial,
    this.value
  });

  PoKetMonListState copyWith({
    AppPoKetMonListStatus? status,
    List<PoKetMonModel>? value,
  }) {
    return PoKetMonListState(
      status: status ?? this.status,
      value: value ?? this.value,
    );
  }

  @override
  String toString() {
    return 'PoKetMonListState(status: $status, value: $value)';
  }
}