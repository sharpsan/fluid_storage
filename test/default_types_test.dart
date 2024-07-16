import 'package:fluid_storage/src/entries/fluid_entry.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Test default value types',
    () {
      final stringDefaultNull = FluidEntry<String, String?>(
        key: 'stringNotNullSecure',
        defaultValue: null,
        isSecure: false,
      );
      expect(stringDefaultNull.defaultValue, isNull);

      final stringDefaultNotNull = FluidEntry<String, String>(
        key: 'stringNotNullSecure',
        defaultValue: 'default',
        isSecure: false,
      );
      expect(stringDefaultNotNull.defaultValue, equals('default'));

      final intDefaultNull = FluidEntry<int, int?>(
        key: 'intDefaultNull',
        defaultValue: null,
        isSecure: false,
      );
      expect(intDefaultNull.defaultValue, isNull);

      final intDefaultNotNull = FluidEntry<int, int>(
        key: 'intDefaultNotNull',
        defaultValue: 0,
        isSecure: false,
      );
      expect(intDefaultNotNull.defaultValue, equals(0));

      final doubleDefaultNull = FluidEntry<double, double?>(
        key: 'doubleDefaultNull',
        defaultValue: null,
        isSecure: false,
      );
      expect(doubleDefaultNull.defaultValue, isNull);

      final doubleDefaultNotNull = FluidEntry<double, double>(
        key: 'doubleDefaultNotNull',
        defaultValue: 0.0,
        isSecure: false,
      );
      expect(doubleDefaultNotNull.defaultValue, equals(0.0));

      final boolDefaultNull = FluidEntry<bool, bool?>(
        key: 'boolDefaultNull',
        defaultValue: null,
        isSecure: false,
      );
      expect(boolDefaultNull.defaultValue, isNull);

      final boolDefaultNotNull = FluidEntry<bool, bool>(
        key: 'boolDefaultNotNull',
        defaultValue: false,
        isSecure: false,
      );
      expect(boolDefaultNotNull.defaultValue, equals(false));
    },
  );
}
