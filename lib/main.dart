import 'package:bw_home_bridge/my_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  final currentUrl = Uri.base;

  /// fonts
  LicenseRegistry.addLicense(() async* {
    final license =
        await rootBundle.loadString('fonts/google_fonts/jost/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  GoogleFonts.config.allowRuntimeFetching = false;

  runApp(App(currentUrl: currentUrl));
}
