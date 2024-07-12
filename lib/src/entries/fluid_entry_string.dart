import 'package:fluid_storage/fluid_storage.dart';

class FluidEntryString<DefaultValueType extends String?>
    extends FluidEntry<String, DefaultValueType> {
  FluidEntryString({
    required super.key,
    required super.defaultValue,
    required super.isSecure,
  });
}
