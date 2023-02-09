import 'package:cloud_firestore/cloud_firestore.dart';
import 'model.dart';

CollectionReference<T> firestoreCollection<T extends Model>({
  required String collectionName,
  required T Function(Map<String, dynamic>) fromJson,
  required Map<String, dynamic> Function(T) toJson,
}) {
  return FirebaseFirestore.instance.collection(collectionName).withConverter<T>(
    fromFirestore: (snapshot, _) {
      final data = snapshot.data()!;
      final json = {
        ...data,
        'id': snapshot.id,
        'createdAt': (data['createdAt'] as Timestamp).toDate().toIso8601String(),
        'updatedAt': (data['updatedAt'] as Timestamp).toDate().toIso8601String(),
      };
      return fromJson(json);
    },
    toFirestore: (model, _) {
      final json = {
        ...toJson(model),
        'createdAt': Timestamp.fromDate(model.createdAt),
        'updatedAt': Timestamp.fromDate(model.updatedAt),
      }..remove('id');
      return json;
    },
  );
}
