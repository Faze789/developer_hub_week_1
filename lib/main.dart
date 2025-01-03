import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_1/home.dart';
import 'package:week_1/provider_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => provider_data(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
