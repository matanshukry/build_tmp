import 'dart:async';

import 'package:build/build.dart';
import 'package:path/path.dart' as path;

  class MyBuilderImpl extends Builder {
  MyBuilderImpl(this.options);

  final BuilderOptions options;

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final assetId = buildStep.inputId;
    final targetPath = path.dirname(assetId.path) + '/../src/output.dart';

    print('Running for: ${buildStep.inputId} to ${targetPath}');
    print('Options: ${this.options.config}');

    final targetAsset = AssetId(assetId.package, targetPath);

    final builtCode = 'int myMethod() { return 4; }';
    await buildStep.writeAsString(targetAsset, builtCode);
  }

  @override
  Map<String, List<String>> get buildExtensions => const {
        'data/data.json': ['src/output.dart']
      };
}
