import 'package:diamonds/data/repository/hive_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HiveService {
  const HiveService(this._hiveRepository);
  final HiveRepository _hiveRepository;

  Future<void> setSelectedMenuItems(List<int> selectedItems) async {
    await _hiveRepository.setSelectedMenuItems(selectedItems);
  }

  List<int> getSelectedMenuItems() {
    return _hiveRepository.getSelectedMenuItems();
  }
}
