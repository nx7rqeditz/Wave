import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/player_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const WaveApp());
}

class WaveApp extends StatelessWidget {
  const WaveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlayerProvider(),
      child: MaterialApp(
        title: 'Wave',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color(0xFFC8A96E),
          scaffoldBackgroundColor: const Color(0xFF0E0E0F),
          fontFamily: 'DM Sans',
          textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}