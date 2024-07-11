import 'package:fluid_storage/src/fluid_storage_manager.dart';

/// This is the preferences manager for the app.
/// Use this as your entry point.
class FluidStorage<T> {
  FluidStorage({required this.entries});

  /// storage manager
  final storage = FluidStorageManager.i;

  /// holds all storage entries
  T entries;

  Future<void> ready() async {
    await storage.ready();
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }
}
