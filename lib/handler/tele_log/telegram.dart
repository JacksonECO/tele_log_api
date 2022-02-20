import 'dart:io' as io;
import 'package:teledart/teledart.dart';

class Telegram {
  late String _chatId;
  late String _token;
  late TeleDart _telegram;

  TeleDart get teleDart => _telegram;

  Telegram(String token, String chatId) {
    _chatId = chatId;
    _token = token;

    _telegram = TeleDart(_token, Event("JacksonAPI"));
  }

  Future<void> send(String text) async {
    await _telegram.sendMessage(_chatId, text);
  }

  Future<void> sendFile(String document, [String name = 'doc.txt', bool debug = false]) async {
    io.File file = await io.File(name).writeAsString(document);
    if (!debug) {
      await _telegram.sendDocument(_chatId, file);
      await file.delete();
    }
  }

  void start() {
    print('Ativando Bot');

    _telegram.start();
    _telegram.onCommand('start').listen((message) => message.reply('Muito obrigado por me adicionar!'));

    _telegram.onCommand('stop').listen((message) {
      message.reply('Isso é tudo pessoal.');
      _telegram.stop();
      print('Stop');
    });

    _telegram
        .onMessage(entityType: 'bot_command', keyword: 'id')
        .listen((message) => _telegram.sendMessage(message.chat.id, message.chat.id.toString()));
  }
}
