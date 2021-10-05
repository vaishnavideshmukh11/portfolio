import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vaishnavi116/provider/dark_theme_provider.dart';
import 'package:vaishnavi116/screens/homepage.dart';
import 'package:vaishnavi116/utils/styles.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.myThemePreferences.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        )
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'My Portfolio',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: HomePage(),
          );
        },
      ),
    );
  }
}
