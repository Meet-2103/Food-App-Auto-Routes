import 'package:flutter/material.dart';
import 'package:food_app_auto_router/core/di/injection_container.dart' as di;
import 'core/navigation_routes/app_router.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
      );
  }
}

//DIFFERENT CONSTATNTS
//search bar