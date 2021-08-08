import 'package:basic_dark_light_sharedprefs/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: notifier.themed ? dark : light,
            home: HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Consumer<ThemeNotifier>(
              builder: (context, ThemeNotifier notifier, _) {
                return SwitchListTile(
                  value: notifier.themed,
                  title: Text(notifier.themed ? 'Dark Mode' : 'Light Mode'),
                  onChanged: (_) {
                    notifier.toggleTheme();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
