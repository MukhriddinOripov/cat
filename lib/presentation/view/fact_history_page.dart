import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cat_bloc.dart';

class FactHistoryPage extends StatefulWidget {
  const FactHistoryPage({super.key});

  @override
  State<FactHistoryPage> createState() => _FactHistoryPageState();
}

class _FactHistoryPageState extends State<FactHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fact History')),
      body: BlocBuilder<CatBloc, CatState>(
        buildWhen: (previous, current) => current is CatFactHistoryLoaded,
        builder: (context, state) {
          if (state is CatLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CatFactHistoryLoaded) {
            return ListView.builder(
              itemCount: state.facts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.facts[index].text),
                  subtitle: Text('Date: ${state.facts[index].deleted}'),
                );
              },
            );
          } else {
            return const Center(child: Text('Error loading fact history'));
          }
        },
      ),
    );
  }
}
