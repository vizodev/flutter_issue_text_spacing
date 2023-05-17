import 'package:flutter/material.dart';
import 'package:flutter_issue_text_spacing/src/features/home/home_page.dart';
import 'package:flutter_issue_text_spacing/src/features/home/home_page.dart';

import 'src/core/web_constrained_box.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData.from(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xffff7136),
        brightness: Brightness.light,
        background: Colors.white,
        surface: Colors.white,
      ),
    ).copyWith(
      // note: material2021 is crashing text spacing in flutter web
      typography: Typography.material2021(),
    );

    return MaterialApp(
      title: 'App Name',
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        textTheme: theme.textTheme
            .copyWith(
              displayLarge: theme.textTheme.displayLarge!
                  .copyWith(fontSize: 67, height: 1.03),
              displayMedium:
                  theme.textTheme.displayMedium!.copyWith(fontSize: 43),
              headlineSmall:
                  theme.textTheme.headlineSmall!.copyWith(fontSize: 22),
              titleLarge: theme.textTheme.titleLarge!.copyWith(fontSize: 20),
              titleMedium: theme.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w400),
              bodyLarge: theme.textTheme.bodyLarge!.copyWith(fontSize: 15),
            )
            .apply(fontFamily: 'roboto'),
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Colors.transparent,
        ),
      ),
      themeMode: ThemeMode.light,
      home: const HomePage(),
      // builder: (context, child) => SizedBox(
      //   child: child ?? const SizedBox.shrink(),
      // ),
      builder: (context, child) => WebConstrainedBox(
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
