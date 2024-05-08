
import '../model/poketmon_model.dart';

abstract class PoKetMonRepository {
  Future<List<PoKetMonModel>> fetchUser();
}