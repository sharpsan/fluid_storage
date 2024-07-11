import 'dart:async';

import 'package:fluid_storage/src/fluid_storage_base.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FluidStorageSharedPreferences extends FluidStorageBase {
  late SharedPreferences _prefs;
  final _initCompleter = Completer<void>();

  FluidStorageSharedPreferences() {
    _init();
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    _initCompleter.complete();
  }

  @override
  Future<void> ready() async {
    if (!_initCompleter.isCompleted) {
      await _initCompleter.future;
    }
  }

  @override
  Future<bool> write<T>(String key, T value) async {
    checkSupportedType<T>(throwIfUnsupported: true);
    if (T == String) {
      return await _prefs.setString(key, value as String);
    } else if (T == int) {
      return await _prefs.setInt(key, value as int);
    } else if (T == double) {
      return await _prefs.setDouble(key, value as double);
    } else if (T == bool) {
      return await _prefs.setBool(key, value as bool);
    } else if (T == List<String>) {
      return await _prefs.setStringList(key, value as List<String>);
    } else {
      throw Exception('Type not supported: $T');
    }
  }

  @override
  Future<T?> read<T>(String key) async {
    if (T == dynamic) {
      return _prefs.get(key) as dynamic;
    } else if (T == String || T == getType<String?>()) {
      return _prefs.getString(key) as T?;
    } else if (T == int || T == getType<int?>()) {
      return _prefs.getInt(key) as T?;
    } else if (T == double || T == getType<double?>()) {
      return _prefs.getDouble(key) as T?;
    } else if (T == bool || T == getType<bool?>()) {
      return _prefs.getBool(key) as T?;
    } else if ((T == List<String>) || T == getType<List<String>?>()) {
      return _prefs.getStringList(key) as T?;
    } else {
      /// Should be unreachable
      throw Exception('Type not supported: $T');
    }
  }

  @override
  Future<bool> delete(String key) async {
    return await _prefs.remove(key);
  }

  @override
  Future<bool> deleteAll() async {
    return await _prefs.clear();
  }

  @override
  Future<bool> containsKey(String key) async {
    return _prefs.containsKey(key);
  }
}
