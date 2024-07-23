// ignore_for_file: unused_import

import 'package:dump_pay/providers/auth_provider.dart';
import 'package:dump_pay/screens/auths/add_email_screen.dart';
import 'package:dump_pay/screens/auths/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> AuthProvider())
    ],
      child: const MaterialApp(
        home: Scaffold(
          body: Center(
            child:SigniNScreen()
          ),
        ),
      ),
    );
  }
}
