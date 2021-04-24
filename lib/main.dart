import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_app/screens/my_app/my_app_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(MyApp());
}
