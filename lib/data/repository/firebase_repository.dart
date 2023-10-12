import 'package:diamonds/data/sources/remote/remote_data_source.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseRepository {
  FirebaseRepository(this._remoteDataSource);
  final RemoteDataSource _remoteDataSource;

  Future<List<String>> getImagesUrl() async {
    return await _remoteDataSource.getStoriesImages();
  }
}
