import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'helper/themedata.dart';
import 'notifiers/update_notifier.dart';
import 'screens/launchscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UpdateNotifier(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Question 1',
        theme: ThemeData(
          primaryColor: colorPrimary,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            color: Colors.white,
            titleTextStyle:
                TextStyle(fontFamily: "opensans_regular", fontSize: 12),
          ),
          fontFamily: 'opensans_regular',
          // primarySwatch: colorPrimary,
          visualDensity: VisualDensity.standard,
        ),
        home: const LaunchScreen(),
      ),
    );
  }
}
