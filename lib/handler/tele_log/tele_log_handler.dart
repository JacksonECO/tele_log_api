import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:tele_log_api/handler/tele_log/telegram.dart';
import 'package:tele_log_api/helpers/constants.dart';

abstract class TeleLogHandler {
  static Future<Response> send(Request request) async {
    var body = jsonDecode(await request.readAsString());
    var telegram = Telegram(Constants.teleLogToken, Constants.developChat);

    telegram.send(jsonEncode(body));

    return Response(202);
  }
}

/*
create table github_log (
    id serial not null,
    name_uid varchar(30) not null,
    repository varchar(50) not null,
    body json not null,
    header json not null,
    event varchar(20) NOT NULL,
    created timestamp default now() not null,
    constraint pk_github_log_id primary key(id)
);


*/