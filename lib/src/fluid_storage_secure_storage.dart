import 'dart:async';
import 'dart:convert';

import 'package:fluid_storage/src/fluid_storage_base.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FluidStorageSecureStorage extends FluidStorageBase {
  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  @override
  Future<bool> deleteAll() async {
    try {
      await _storage.deleteAll();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> containsKey(String key) {
    return _storage.containsKey(key: key);
  }

  @override
  Future<bool> delete(String key) async {
    try {
      await _storage.delete(key: key);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<T?> read<T>(String key) async {
    final stringValue = await _storage.read(key: key);
    if (stringValue == null) {
      return null;
    }

    dynamic mutatedValue;
    if (T == dynamic) {
      mutatedValue = stringValue as dynamic;
    } else if (T == String) {
      mutatedValue = stringValue;
    } else if (T == int) {
      mutatedValue = int.parse(stringValue);
    } else if (T == double) {
      mutatedValue = double.parse(stringValue);
    } else if (T == bool) {
      mutatedValue = stringValue == 'true';
    } else if (T == List) {
      mutatedValue = json.decode(stringValue);
    } else {
      /// Should be unreachable
      throw Exception('Type not supported: $T');
    }
    return mutatedValue as T;
  }

  @override
  FutureOr<void> ready() {}

  @override
  Future<bool> write<T>(String key, T value) async {
    checkSupportedType<T>(throwIfUnsupported: true);
    String? mutatedValue;
    if (T is List) {
      /// encode as json and store
      mutatedValue = json.encode(value);
    } else {
      mutatedValue = value.toString();
    }
    await _storage.write(key: key, value: mutatedValue);
    return true;
  }
}
