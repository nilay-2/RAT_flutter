import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import "./DateTimeFormatter.dart";
String convertTimeStamp (String timestamp, String condition) {
  int timeStampInMilliseconds = int.tryParse(timestamp) ?? 0;
  String dateTime = DateTime.fromMillisecondsSinceEpoch(timeStampInMilliseconds).toString();

  return formatTimestamp(dateTime, condition);
}