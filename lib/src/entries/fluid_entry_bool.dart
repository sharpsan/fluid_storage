import 'package:fluid_storage/fluid_storage.dart';

class FluidEntryBool<DefaultValueType extends bool?>
    extends FluidEntry<bool, DefaultValueType> {
  FluidEntryBool({
    required super.key,
    required super.defaultValue,
    required super.isSecure,
  });
}
