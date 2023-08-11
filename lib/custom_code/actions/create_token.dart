// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:crypto/crypto.dart';
import 'dart:convert';

Future<String?> createToken() async {
  String server_application_code = 'NAUBANKSTG-EC-SERVER';
  String server_app_key = 'DXtFo0mFhs5YqNG1kl9LpRhWjkl12I';
  String unix_timestamp =
      (DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000).toString();
  String utc_timestamp = DateTime.now().toUtc().toString();

  String uniq_token_string = server_app_key + unix_timestamp;

  List<int> bytes = utf8.encode(uniq_token_string);
  Digest digest = sha256.convert(bytes);
  String hash = digest.toString();

  String auth_token = base64
      .encode(utf8.encode('$server_application_code;$unix_timestamp;$hash'));
  return auth_token;
}
