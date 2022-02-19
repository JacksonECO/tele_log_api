import 'package:shelf/shelf.dart';

abstract class TeleLogHandler {
  static Response send(Request request) {
    print('Context:');
    print(request.context);
    print('\n');
    print('\n');

    print('Headers:');
    print(request.headers);
    print('\n');
    print('\n');

    print('Headers ALL:');
    print(request.headersAll);
    print('\n');
    print('\n');

    print('Url:');
    print(request.url.toString());
    print('\n');
    print('\n');

    print('Url:');
    print(request.requestedUri);
    print('\n');
    print('\n');

    return Response(202);
  }
}
