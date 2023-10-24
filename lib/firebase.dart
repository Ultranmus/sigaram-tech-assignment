import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sigaram_tech_assignment/models/video_item.dart';

final firebaseProvider =
    Provider((ref) => FirebaseService(firestore: FirebaseFirestore.instance));

class FirebaseService {
  final FirebaseFirestore firestore;

  FirebaseService({required this.firestore});

// this should return a list of length 2 minimum because bottom navigation bar need atleast 2 items
  Future<List<String>> fetchBottomTaryDocument() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      final DocumentSnapshot documentSnapshot = await firestore
          .collection('bottom_tray_options')
          .doc('bottom_tray_options')
          .get();

      if (documentSnapshot.exists) {
        final Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        List<String> optionsList = [];
        data.forEach((key, value) {
          optionsList.add('$value');
        });

        return optionsList;
      } else {
        print('Document not found');
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<List<String>> fetchLanguages() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      final DocumentSnapshot documentSnapshot = await firestore
          .collection('language_options')
          .doc('language_options')
          .get();

      if (documentSnapshot.exists) {
        final Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        List<String> optionsList = [];
        data.forEach((key, value) {
          optionsList.add('$value');
        });

        return optionsList;
      } else {
        print('Document not found');
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<List<String>> fetchColors() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      final DocumentSnapshot documentSnapshot = await firestore
          .collection('color_options')
          .doc('color_options')
          .get();

      if (documentSnapshot.exists) {
        final Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        List<String> optionsList = [];
        data.forEach((key, value) {
          optionsList.add('$value');
        });

        return optionsList;
      } else {
        print('Document not found');
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<void> saveOptionText(String id, int index, String text) async {
    try {
      final DocumentReference docRef = firestore.collection(id).doc(id);
      final Map<String, dynamic> data = {
        'Option_$index': text,
      };
      await docRef.set(data, SetOptions(merge: true));
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<List<VideoItem>> fetchVideos() async {
    try {
      final collection = firestore.collection('video_links');

      final querySnapshot = await collection.get();

      final dataList = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return VideoItem.fromMap(data);
      }).toList();

      return dataList;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  Future<void> saveDataToFirestore(List<VideoItem> dataList) async {
    final collection = firestore.collection('video_links');

    for (var videoItem in dataList) {
      final newDocumentRef = collection.doc();

      await newDocumentRef.set(videoItem.toMap());
    }

    print('Data saved to Firestore');
  }
}
