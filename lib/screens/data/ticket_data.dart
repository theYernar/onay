import 'dart:math';

import 'package:intl/intl.dart';

String busNumber = '48';
String busGosNumber = '232AF02';
String randomCode = generateRandomCode(5, 7);
String date = formattedDate;

String hour = '20';
String minutes = '10';
String time = '$hour:$minutes';

String generateRandomCode(int min, int max) {
  const String letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
  Random random = Random();

  int randomLength = min + random.nextInt(max - min + 1);

  return List.generate(
      randomLength, (index) => letters[random.nextInt(letters.length)]).join();
}

DateTime now = DateTime.now(); // Получить текущую дату и время
String formattedDate =
    DateFormat('dd.MM.yyyy').format(now); // Форматировать дату