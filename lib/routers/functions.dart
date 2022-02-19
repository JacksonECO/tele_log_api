import 'dart:convert';

import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:tele_log_api/routers/tele_log/tele_log_router.dart';

@CloudFunction()
Future<Response> function(Request request) async {
  final router = Router();

  router.get('/', (Request request) {
    return Response.ok(jsonEncode({'status': 'ok'}));
  });

  router.mount('/teleLog', teleLogRouter);

  return router(request);
}
