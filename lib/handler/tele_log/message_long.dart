/// Corrige o erro HttpClientException: 400 Bad Request: message is too long \
/// Gerado quando a mensagem envida para o Telegram tiver mais que 4096 caracteres
abstract class MessageLong {
  static int _max = 4095;
  static List<String> _message = <String>[];

  static void _breakLine() {
    for (var i = 0; i < _message.length; i++) {
      if (_message[i].length > _max) {
        _message.add('');
        for (var d = _message.length - 1; d > i + 1; d--) {
          _message[d - 1] = _message[d];
        }
        _message[i + 1] = _message[i].substring(_max);
        _message[i] = _message[i].substring(0, _max);
      }
    }
  }

  static void _split(String input, bool isJson) {
    if (isJson) {
      _message = input.replaceAll('","', '",\n"').split('\n');
      return;
    }
    _message = input.split('\n');
  }

  static void _joinLine() {
    for (var i = 0; i < _message.length - 1; i++) {
      if (_message[i].length + _message[i + 1].length <= _max) {
        _message[i] += '\n' + _message.removeAt(i + 1);

        _joinLine();
        break;
      }
    }
  }

  static List<String> separation(String input, {bool isJson = false, Function? forEach}) {
    _split(input, isJson);
    _breakLine();
    _joinLine();

    if (forEach != null) {
      _message.forEach((element) async {
        await forEach(element);
      });
    }

    return _message;
  }
}
