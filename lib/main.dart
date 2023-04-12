import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:promina/view_layers/login_view/login_view.dart';
import 'application_layer/components/constants/constants.dart';
import 'application_layer/services/bloc_observer.dart';
import 'application_layer/services/network_services/dio_services_management/dio_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: ConstantStrings.kMina,
      debugShowCheckedModeBanner: false,
      home: LogInViewActivity(),
    );
  }
}

