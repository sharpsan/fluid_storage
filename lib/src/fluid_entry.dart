import 'package:fluid_storage/src/fluid_storage_base.dart';
import 'package:fluid_storage/src/fluid_storage_manager.dart';

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
      ? FluidStorageManager.i.secureStorage
      : FluidStorageManager.i.sharedPreferences;

  Future<bool> write(ValueType value) async {
    return await prefs.write<ValueType>(key, value);
  }

  Future<DefaultValueType> read() async {
    return await prefs.read<DefaultValueType>(key) ?? defaultValue;
  }

  Future<bool> delete() async {
    return await prefs.delete(key);
  }
}
