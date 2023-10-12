import 'package:diamonds/data/repository/firebase_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseService {
  const FirebaseService(this._firebaseRepository);
  final FirebaseRepository _firebaseRepository;

  Future<List<String>> getImagesUrl() async {
    return await _firebaseRepository.getImagesUrl();
  }
}
