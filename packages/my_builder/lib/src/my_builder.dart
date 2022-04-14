import 'package:build/build.dart';
import 'package:my_builder/src/my_build_impl.dart';

Builder myBuilder(BuilderOptions options) => MyBuilderImpl(options);
