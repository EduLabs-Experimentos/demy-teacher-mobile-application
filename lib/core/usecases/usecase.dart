// ignore_for_file: avoid_types_as_parameter_names
abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

// A class representing no parameters for use cases that do not require any input.
class NoParams {}