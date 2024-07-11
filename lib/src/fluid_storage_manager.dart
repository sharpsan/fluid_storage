import 'package:fluid_storage/src/fluid_storage_secure_storage.dart';
import 'package:fluid_storage/src/fluid_storage_shared_preferences.dart';

/// This class handles the storage implementations.
class FluidStorageManager {
  FluidStorageManager._();

  static final FluidStorageManager i = FluidStorageManager._();

  /// storage implementations
  final secureStorage = FluidStorageSecureStorage();
  final sharedPreferences = FluidStorageSharedPreferences();

  Future<void> ready() async {
    await secureStorage.ready();
    await sharedPreferences.ready();
  }

  Future<void> deleteAll() async {
    await secureStorage.deleteAll();
    await sharedPreferences.deleteAll();
  }
}
