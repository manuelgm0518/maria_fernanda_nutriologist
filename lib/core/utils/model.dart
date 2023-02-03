// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:uuid/uuid.dart';

// part 'model.freezed.dart';
// part 'model.g.dart';

// @freezed
// class Model with _$Model {
//   factory Model({
//     required String id,
//     required DateTime createdAt,
//     required DateTime updatedAt,
//   }) = _Model;

//   static Model initial() {
//     return Model(
//       id: const Uuid().v4(),
//       createdAt: DateTime.now(),
//       updatedAt: DateTime.now(),
//     );
//   }

//   factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
// }

abstract class Model {
  String get id;
  DateTime get createdAt;
  DateTime get updatedAt;
}
