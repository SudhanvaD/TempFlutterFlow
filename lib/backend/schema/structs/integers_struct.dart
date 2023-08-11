// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IntegersStruct extends BaseStruct {
  IntegersStruct({
    int? num,
  }) : _num = num;

  // "num" field.
  int? _num;
  int get num => _num ?? 0;
  set num(int? val) => _num = val;
  void incrementNum(int amount) => _num = num + amount;
  bool hasNum() => _num != null;

  static IntegersStruct fromMap(Map<String, dynamic> data) => IntegersStruct(
        num: castToType<int>(data['num']),
      );

  static IntegersStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? IntegersStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'num': _num,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'num': serializeParam(
          _num,
          ParamType.int,
        ),
      }.withoutNulls;

  static IntegersStruct fromSerializableMap(Map<String, dynamic> data) =>
      IntegersStruct(
        num: deserializeParam(
          data['num'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'IntegersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IntegersStruct && num == other.num;
  }

  @override
  int get hashCode => const ListEquality().hash([num]);
}

IntegersStruct createIntegersStruct({
  int? num,
}) =>
    IntegersStruct(
      num: num,
    );
