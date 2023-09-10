import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatTimestamp(String timestamp, String condition) {
  final dateTime = DateTime.parse(timestamp);
  var formattedDate;
  if(condition == "DateTime") {
    formattedDate = DateFormat('dd/MM/yyyy h:mm a').format(dateTime);
  } else if (condition == "Date") {
    formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  }
  return formattedDate;
}