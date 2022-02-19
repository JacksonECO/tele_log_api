// GENERATED CODE - DO NOT MODIFY BY HAND
// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:functions_framework/serve.dart';
import 'package:tele_log_api/routers/functions.dart' as function_library;
import 'package:tele_log_api/home/system.dart';
import 'package:tele_log_api/home/test.dart';

// dart pub run build_runner build --delete-conflicting-outputs
// dart compile exe bin/tele_log_api.dart -o bin/server.exe

const bool production = true;
Future<void> main(List<String> args) async {
  print('Ativando API em modo de ' + (production ? 'produção' : 'teste'));
  if (production) {
    system();
    await serve(args, _nameToFunctionTarget);
  } else {
    // ignore: unawaited_futures
    if (isTestHaveServer) serve(args, _nameToFunctionTarget);
    return await test();
  }
}

FunctionTarget? _nameToFunctionTarget(String name) {
  switch (name) {
    case 'function':
      return FunctionTarget.http(
        function_library.function,
      );
    default:
      return null;
  }
}
