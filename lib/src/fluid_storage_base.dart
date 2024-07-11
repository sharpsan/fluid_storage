import 'dart:async';

abstract class FluidStorageBase {
  /// Waits for the instance to be ready.
  ///
  /// NOTE: This must be called before any other method.
  FutureOr<void> ready();

  Future<bool> write<T>(String key, T value);

  Future<T?> read<T>(String key);

  Future<bool> delete(String key);

  Future<bool> deleteAll();

  Future<bool> containsKey(String key);

  /// Returns true if the type is supported.
  bool checkSupportedType<T>({
    bool throwIfUnsupported = false,
  }) {
    final isSupported = (T == String ||
        T == int ||
        T == double ||
        T == bool ||
        T == (List<String>) ||
        T == (List<int>) ||
        T == (List<double>) ||
        T == (List<bool>));
    if (throwIfUnsupported && !isSupported) {
      throw Exception('Type not supported: $T');
    }
    return isSupported;
  }

  Type getType<T>() => T;
}
