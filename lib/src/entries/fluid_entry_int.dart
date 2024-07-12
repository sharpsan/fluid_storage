import 'package:fluid_storage/fluid_storage.dart';

class FluidEntryInt<DefaultValueType extends int?>
    extends FluidEntry<int, DefaultValueType> {
  FluidEntryInt({
    required super.key,
    required super.defaultValue,
    required super.isSecure,
  });
}
