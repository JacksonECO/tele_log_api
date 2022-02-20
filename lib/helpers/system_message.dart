/// Gerencia uma lista de mensagens
class SystemMessage {
  final List<String> _message = [];

  /// Add `value` em outra linha.
  SystemMessage addLine(var value) {
    _message.add(value.toString());
    return this;
  }

  /// Add `value` na mesma linha, com um ' ' do último conteúdo.
  ///
  /// Para não colocar o ' ' deve definir o parâmetro `space` como `false`
  SystemMessage add(var value, [bool space = true]) {
    _message.last += (space ? ' ' : '') + value.toString();
    return this;
  }

  /// Add linhas em branco;
  ///
  /// O parâmetro `value` define a quantidade de linhas em branco;
  ///
  /// Por padrão é definido com `1`
  SystemMessage spaceLine([int value = 1]) {
    for (var i = 0; i < value; i++) {
      _message.add('');
    }
    return this;
  }

  /// Retorna uma lista de Mensagens [String]
  List<String> toList() {
    return _message;
  }

  @override
  String toString() {
    var temp = '';
    for (var i = 0; i < _message.length; i++) {
      temp += (i != 0 ? '\n' : '') + _message[i];
    }
    return temp.toString();
  }
}
