import 'package:cat/presentation/bloc/cat_bloc.dart';
import 'package:cat/presentation/view/cat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/intection_container.dart';

void main() {
  InjectionContainer.instance.initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatBloc(InjectionContainer.instance.getIt())..add(GetCatFact()),
      child: const MaterialApp(
        title: 'Cat',
        home: CatPage(),
      ),
    );
  }
}
