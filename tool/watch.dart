import 'package:build_runner/build_runner.dart';
import 'package:built_value_generator/built_value_generator.dart';

import 'phases.dart';

/// Example of how to use source_gen with [BuiltValueGenerator].
///
/// Import the generators you want and pass them to [build] as shown,
/// specifying which files in which packages you want to run against.
void main() {
  watch(phases, deleteFilesByDefault: true);
}
