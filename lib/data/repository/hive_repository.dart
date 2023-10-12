import 'package:diamonds/data/sources/local/preferences_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HiveRepository {
  const HiveRepository(this._preferencesStorage);
  final PreferencesStorage _preferencesStorage;

  Future<void> setSelectedMenuItems(List<int> selectedItems) async {
    await _preferencesStorage.setSelectedMenuItems(selectedItems);
  }

  List<int> getSelectedMenuItems() {
    return _preferencesStorage.getSelectedMenuItems();
  }
}
