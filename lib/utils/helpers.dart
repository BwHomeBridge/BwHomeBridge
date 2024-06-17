import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'mc_colors.dart';

class McHelpers {
  McHelpers._();

  ///
  static bool isDarkTheme(BuildContext context) {
    /// Todo: isDarkTheme
    return true;
  }

  ///
  static void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  ///
  static String formatTime(DateTime dateTime) {
    return DateFormat.jm().format(dateTime.toLocal());
  }

  ///
  static String formatDate(DateTime dateTime) {
    return DateFormat.yMd().format(dateTime.toLocal());
  }

  static String formatDateFromString(String dateTime) {
    try {
      var dt = DateTime.parse(dateTime).toLocal();
      return DateFormat.yMd().format(dt);
    } catch (e) {
      return '';
    }
  }

  static String formatDateTimeFromString(String dateTime) {
    try {
      var dt = DateTime.parse(dateTime).toLocal();
      return '${DateFormat.yMd().format(dt)} ${DateFormat.jm().format(dt)}';
    } catch (e) {
      return '';
    }
  }

  static String formatDateTime(String? dateTime) {
    try {
      const String pattern = 'dd.MM.yyyy HH:mm';
      var dt = convertDateTime(dateTime).toLocal();
      return DateFormat(pattern).format(dt);
    } catch (e) {
      return '';
    }
  }

  static DateTime convertDateTime(String? dateTime) {
    try {
      return dateTime != null ? DateTime.parse(dateTime) : DateTime.now();
    } catch (e) {
      return DateTime.now();
    }
  }

  static Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    return picked;
  }

  static Future<TimeOfDay?> selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    return selectedTime;
  }

  static void showSnackBar(
    BuildContext context,
    String msg, {
    int seconds = 2,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: Duration(seconds: seconds),
      // action: SnackBarAction(
      //   label: 'ACTION',
      //   onPressed: () {},
      // ),
    ));
  }

  ///
  static canonicalizedMap(Map<String, dynamic> json) {
    return CanonicalizedMap.from(json, (str) => canonicalize(str));
  }

  /// run flutter test test/mc_helpers_test.dart
  /// if you edit!!
  /// - converts strings to EG..
  /// - IDOcevidnik => idOcevidnik
  /// - KorisnikID => korisnikId
  /// - FAO => fao
  /// - Sifra_EU => sifraEu
  static String canonicalize(String str) {
    var strFinal = '';

    for (int x = 0; x < str.length; x++) {
      var char = str[x];

      if (x == 0) {
        strFinal = strFinal + char.toLowerCase();
      } else {
        var nextCharIndex = x + 1;

        if (nextCharIndex < str.length) {
          var nextChar = str[nextCharIndex];

          var nextCharIsUpperCase = nextChar.toUpperCase() == nextChar;
          var nextCharIsNotLastChar = nextCharIndex < str.length - 1;

          if (nextCharIsUpperCase && nextCharIsNotLastChar) {
            strFinal = strFinal + char.toLowerCase();
          } else {
            strFinal = strFinal + char;
          }
        } else {
          strFinal = strFinal + char.toLowerCase();
        }
      }
    }

    if (str.toUpperCase() == str) {
      strFinal = strFinal.toLowerCase();
    }

    if (strFinal.contains('_')) {
      var newStr = '';
      var upper = false;
      for (int x = 0; x < str.length; x++) {
        var l = strFinal[x];
        if (upper) {
          newStr = newStr + l.toUpperCase();
          upper = false;
        } else if (l == '_') {
          upper = true;
        } else {
          newStr = newStr + l;
        }
      }

      strFinal = newStr;

      // strFinal = newStr.replaceAll('_', '');
    }

    return strFinal;
  }

  static showErrorMessage(BuildContext context, dynamic error) {
    Fluttertoast.showToast(
      msg: error.message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: McColors.error,
      textColor: McColors.white,
      fontSize: 16.0,
    );
  }

  static showSimpleErrorMessage(BuildContext context, String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: McColors.error,
      textColor: McColors.white,
      fontSize: 16.0,
      webShowClose: false,
      webBgColor: McColors.error.toString(),
      webPosition: "center",
    );
  }

  static showInfoMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: McColors.primary2,
      textColor: McColors.black,
      fontSize: 16.0,
      webBgColor: McColors.primary2.toString(),
      webPosition: "center",
    );
  }
}
