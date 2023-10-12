import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<String>> getStoriesImages() async {
    try {
      final QuerySnapshot querySnapshot = await _firestore.collection('images').get();

      final List<String> urls = [];

      for (final QueryDocumentSnapshot document in querySnapshot.docs) {
        final Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;
        if (data != null) {
          final dynamic imageUrl = data['url'];
          if (imageUrl is String) {
            urls.add(imageUrl);
          }
        }
      }
      return urls;
    } catch (e) {
      rethrow;
    }
  }
}
