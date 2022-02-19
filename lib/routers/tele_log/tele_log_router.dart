import 'dart:convert';

import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:tele_log_api/handler/tele_log/tele_log_handler.dart';

@CloudFunction()
Future<Response> teleLogRouter(Request request) async {
  final router = Router();

  router.post('/', TeleLogHandler.send);

  return router(request);
}
