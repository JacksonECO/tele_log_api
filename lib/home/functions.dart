import 'dart:convert';

import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

@CloudFunction()
Future<Response> function(Request request) async {
  final router = Router();
  
  router.get('/', (Request request) {
    return Response.ok(jsonEncode({'status': 'ok'}));
  });

/*
  ///
  /// Requisição manual de cafe
  ///

  router.get('/cafe', (Request request) async {
    return Response.ok(await coffeeNow());
  });

  ///
  /// Tentativa de usar como banco de dados
  ///
  router.get('/set', (Request request) async {
    var bd = await Bd().open('test');
    await bd.setDados('main', bd.info);
    await bd.setDados(now().toString(), now().millisecondsSinceEpoch);
    await bd.close();
    return Response.ok(now()).toString();
  });

  router.get('/get', (Request request) async {
    var bd = await Bd().open('test');
    var temp = await bd.getMapAll;
    await bd.close();
    return Response.ok(temp.toString());
  });
*/
  return router(request);
}
