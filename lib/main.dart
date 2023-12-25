import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task/calculator.dart';
import 'package:task/other/calculator.dart';
import 'package:task/other/calculator_viewModel.dart';
import 'package:task/screens/model/model.dart';

void main() async{
  
  await Hive.initFlutter();
   Hive.registerAdapter(DatabaseModelAdapter());
  await Hive.openBox<DatabaseModel>("myBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalculatorViewModelOther()),
  
      ],
      child: ScreenUtilInit(
        designSize: const Size(400, 800),
        builder: (context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:    const CalculatorScreen(),
        ),
      ),
    );
  }
}

