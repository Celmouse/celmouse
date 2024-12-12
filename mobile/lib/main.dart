import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'src/config/dependencies.dart'; // Import the getit.dart file
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: defaultProvider,
      child: const MyApp(),
    ),
  );
}
