import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/config.dart';
import 'config/provider/providers.dart';
import 'core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  return runApp(
    const AnanJewelApp(),
  );
}

///  Main application class from where the application will begin running.
class AnanJewelApp extends StatefulWidget {
  /// Constructor of the main class.
  const AnanJewelApp({Key? key}) : super(key: key);

  @override
  State<AnanJewelApp> createState() => _AnanJewelAppState();
}

class _AnanJewelAppState extends State<AnanJewelApp> {
  bool isInitialized = false;
  @override
  void initState() {
    _initializeCacheStorage();
    super.initState();
  }

  _initializeCacheStorage() async {
    VariableUtilities.preferences = await SharedPreferences.getInstance();
    setState(() {
      isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      return const SizedBox();
    }
    return MultiProvider(
      providers: Providers.providers,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          initialRoute: RouteConfig.root,
          onGenerateRoute: RouteConfig.onGenerateRoute,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: false,
            scaffoldBackgroundColor: whiteColor,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: blackColor,
              selectionColor: blackColor,
              selectionHandleColor: blackColor,
            ),
          ),
        );
      },
    );
  }
}
