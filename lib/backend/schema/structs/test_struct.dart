// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TestStruct extends FFFirebaseStruct {
  TestStruct({
    String? video,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _video = video,
        super(firestoreUtilData);

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  set video(String? val) => _video = val;
  bool hasVideo() => _video != null;

  static TestStruct fromMap(Map<String, dynamic> data) => TestStruct(
        video: data['video'] as String?,
      );

  static TestStruct? maybeFromMap(dynamic data) =>
      data is Map ? TestStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'video': _video,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'video': serializeParam(
          _video,
          ParamType.String,
        ),
      }.withoutNulls;

  static TestStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestStruct(
        video: deserializeParam(
          data['video'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TestStruct && video == other.video;
  }

  @override
  int get hashCode => const ListEquality().hash([video]);
}

TestStruct createTestStruct({
  String? video,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TestStruct(
      video: video,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TestStruct? updateTestStruct(
  TestStruct? test, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    test
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTestStructData(
  Map<String, dynamic> firestoreData,
  TestStruct? test,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (test == null) {
    return;
  }
  if (test.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && test.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final testData = getTestFirestoreData(test, forFieldValue);
  final nestedData = testData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = test.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTestFirestoreData(
  TestStruct? test, [
  bool forFieldValue = false,
]) {
  if (test == null) {
    return {};
  }
  final firestoreData = mapToFirestore(test.toMap());

  // Add any Firestore field values
  test.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTestListFirestoreData(
  List<TestStruct>? tests,
) =>
    tests?.map((e) => getTestFirestoreData(e, true)).toList() ?? [];
