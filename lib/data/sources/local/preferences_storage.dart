import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PreferencesStorage {
  static const String _boxAppPreferences = 'app-preferences';
  static const String _keySelectedMenuItems = '$_boxAppPreferences/selected-menu-items';
  static final PreferencesStorage _instance = PreferencesStorage._internal();

  factory PreferencesStorage() => _instance;
  PreferencesStorage._internal();

  late Box _appPreferences;

  Future<void> init() async {
    _appPreferences = await Hive.openBox(_boxAppPreferences);
  }

  Future<void> clear() => _appPreferences.clear();

  Future<void> setSelectedMenuItems(List<int> selectedItems) async {
    await _appPreferences.put(_keySelectedMenuItems, selectedItems);
  }

  List<int> getSelectedMenuItems() {
    return _appPreferences.get(_keySelectedMenuItems, defaultValue: []);
  }
}
