import 'package:fluid_storage/src/fluid_storage_secure_storage.dart';
import 'package:fluid_storage/src/fluid_storage_shared_preferences.dart';

/// This is the preferences manager for the app.
class FluidStorage<T> {
  /// storage implementations
  final secureStorage = FluidStorageSecureStorage();
  final sharedPreferences = FluidStorageSharedPreferences();

  T? _entries;

  FluidStorage._();

  static final FluidStorage i = FluidStorage._();

  void init({
    required T entries,
  }) {
    _entries = entries;
  }

  /// All app preference entries reside here.
  T get entries {
    if (_entries == null) {
      throw Exception('Entries not initialized');
    }
    return _entries!;
  }

  Future<void> ready() async {
    await secureStorage.ready();
    await sharedPreferences.ready();
  }

  Future<void> deleteAll() async {
    await secureStorage.deleteAll();
    await sharedPreferences.deleteAll();
  }
}
