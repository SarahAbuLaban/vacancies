import 'package:flutter/material.dart';

import 'app.dart';
import 'shared/services/preferences_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager.initialize();
  runApp(const MyApp());
}
