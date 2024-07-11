import 'package:fluid_storage/src/fluid_storage.dart';
import 'package:fluid_storage/src/fluid_storage_base.dart';

abstract class FluidEntry<ValueType, DefaultValueType extends ValueType?> {
  final String key;
  final DefaultValueType defaultValue;
  final bool isSecure;

  FluidEntry({
    required this.key,
    required this.defaultValue,
    required this.isSecure,
  });

  FluidStorageBase get prefs => isSecure
      ? FluidStorage.i.secureStorage
      : FluidStorage.i.sharedPreferences;

  Future<bool> write(ValueType value) async {
    return await prefs.write<ValueType>(key, value);
  }

  Future<DefaultValueType> read() async {
    return await prefs.read(key) ?? defaultValue;
  }

  Future<bool> delete() async {
    return await prefs.delete(key);
  }
}
