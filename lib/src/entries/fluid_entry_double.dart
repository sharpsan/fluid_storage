import 'package:fluid_storage/fluid_storage.dart';

class FluidEntryDouble<DefaultValueType extends double?>
    extends FluidEntry<double, DefaultValueType> {
  FluidEntryDouble({
    required super.key,
    required super.defaultValue,
    required super.isSecure,
  });
}
