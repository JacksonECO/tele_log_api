Future<void> loop({int seconds = 0, int minutes = 0, int hours = 0, int days = 0, Duration? duration}) async {
  if (duration == null) {
    await Future.delayed(Duration(seconds: seconds, minutes: minutes, hours: hours, days: days));
  } else {
    await Future.delayed(duration);
  }
}

Future<void> actionTime(int hours, int minutes, Function action) async {
  var now = DateTime.now().subtract(Duration(hours: 3));

  if (now.difference(DateTime(now.year, now.month, now.day, hours, minutes)).inMinutes >= 0) {
    // proximo dia;
    // print('prox');
    await loop(duration: DateTime(now.year, now.month, now.day + 1, hours, minutes).difference(now));
  } else {
    // hoje;
    // print('dia');
    await loop(duration: DateTime(now.year, now.month, now.day, hours, minutes).difference(now));
  }

  action();

  // ignore: unawaited_futures
  actionTime(hours, minutes, action);
}

DateTime now() {
  return DateTime.now().subtract(Duration(hours: 3));
}
