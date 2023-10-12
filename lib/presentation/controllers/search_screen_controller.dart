import 'package:diamonds/domain/hive_service.dart';
import 'package:flutter/foundation.dart';
import 'package:diamonds/domain/firebase_service.dart';
import 'package:diamonds/presentation/ui_kit/icons.dart';

class SearchScreenController extends ChangeNotifier {
  SearchScreenController(this._firebaseService, this._hiveService) {
    getStoriesImages();
    syncWithHive();
  }

  final FirebaseService _firebaseService;
  final HiveService _hiveService;

  final List<String> icons = [
    SvgAssets.iconRound,
    SvgAssets.iconRadiant,
    SvgAssets.iconCushion,
    SvgAssets.iconEmerald,
    SvgAssets.iconAsscher,
    SvgAssets.iconCarre,
    SvgAssets.iconPrincess,
    SvgAssets.iconPear,
    SvgAssets.iconOval,
  ];

  final List<String> categories = [
    "Round",
    "Radiant",
    "Cushion",
    "Emerald",
    "Asscher",
    "Carre",
    "Princess",
    "Pear",
    "Oval"
  ];

  List<String> _imagesUrl = [];
  bool _isLoading = false;
  bool _isError = false;
  String _errorDescription = '';
  List<int> _activeIndices = [];

  List<int> get activeIndices => _activeIndices;
  bool get isLoading => _isLoading;
  bool get isError => _isError;
  String get errorDescription => _errorDescription;
  List<String> get imagesUrl => _imagesUrl;

  Future<void> getStoriesImages() async {
    _isLoading = true;
    _isError = false;
    notifyListeners();

    try {
      _imagesUrl = await _firebaseService.getImagesUrl();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      _isError = true;
      _errorDescription = 'An error occurred while fetching images.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleActiveIndex(int index) async {
    if (_activeIndices.contains(index)) {
      _activeIndices.remove(index);
    } else {
      _activeIndices.add(index);
    }
    notifyListeners();
  }

  Future<void> toggleAll() async {
    if (_activeIndices.length == categories.length) {
      _activeIndices.clear();
    } else {
      _activeIndices = List.generate(categories.length, (index) => index);
    }
    notifyListeners();
  }

  void syncWithHive() {
    final savedActiveIndices = _hiveService.getSelectedMenuItems();
    _activeIndices = savedActiveIndices;
    notifyListeners();
  }

  void saveToHive() async {
    await _hiveService.setSelectedMenuItems(_activeIndices);
  }
}
