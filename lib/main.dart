import 'package:cisapp_intern_assigment/src/core/api/dio_factory.dart';
import 'package:cisapp_intern_assigment/src/features/apps/presentation/cubit/apps_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'src/features/apps/presentation/cubit/bloc_observer/bloc_observer.dart';
import 'src/features/apps/presentation/pages/signinPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioFactory.getDio();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AppsCubit(),
        child: const SignInPage(),
      ),
    );
  }
}
