import 'package:shelf/shelf.dart';

abstract class TeleLogHandler {
  static Future<Response> send(Request request) async {
    print('Url:');
    print(request.requestedUri);

    print('Context:');
    print(await request.readAsString());
    print('\n');

    print('Headers:');
    print(request.headers);
    print('\n');

    return Response(202);
  }
}
