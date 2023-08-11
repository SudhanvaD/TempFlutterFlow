import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _LocalState = prefs.getString('ff_LocalState') ?? _LocalState;
    });
    _safeInit(() {
      _UserID = prefs.getString('ff_UserID') ?? _UserID;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _LocalState = '';
  String get LocalState => _LocalState;
  set LocalState(String _value) {
    _LocalState = _value;
    prefs.setString('ff_LocalState', _value);
  }

  String _UserID = '7403';
  String get UserID => _UserID;
  set UserID(String _value) {
    _UserID = _value;
    prefs.setString('ff_UserID', _value);
  }

  String _cardType = 'mc';
  String get cardType => _cardType;
  set cardType(String _value) {
    _cardType = _value;
  }

  String _discover = 'dc';
  String get discover => _discover;
  set discover(String _value) {
    _discover = _value;
  }

  String _AmericanExpress = 'ax';
  String get AmericanExpress => _AmericanExpress;
  set AmericanExpress(String _value) {
    _AmericanExpress = _value;
  }

  String _diners = 'di';
  String get diners => _diners;
  set diners(String _value) {
    _diners = _value;
  }

  String _visa = 'vi';
  String get visa => _visa;
  set visa(String _value) {
    _visa = _value;
  }

  String _mastercard = 'mc';
  String get mastercard => _mastercard;
  set mastercard(String _value) {
    _mastercard = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
