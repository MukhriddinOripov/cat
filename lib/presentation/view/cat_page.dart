import 'package:cat/core/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cat_bloc.dart';
import 'fact_history_page.dart';

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cat Facts')),
      body: BlocBuilder<CatBloc, CatState>(
        buildWhen: (previous, current) => current is CatLoaded || current is CatLoading || current is CatError,
        builder: (context, state) {
          if (state is CatLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CatLoaded) {
            return Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Image.network(Endpoint.getRandomImage, height: 200, width: 200),
                  const SizedBox(height: 20),
                  Text(state.fact.text),
                  const SizedBox(height: 10),
                  Text('Date: ${state.fact.updatedAt}'),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => context.read<CatBloc>().add(GetCatFact()),
                    child: const Text('Another fact!'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CatBloc>().add(GetCatFactHistory());
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FactHistoryPage()),
                      );
                    },
                    child: const Text('Fact history'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Error loading fact'));
          }
        },
      ),
    );
  }
}
