import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class IncDecPage extends StatelessWidget {
  const IncDecPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      floatingActionButton: Column(
        children: [
          FloatingActionButton(
            onPressed: () {
              counterCubit.increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              counterCubit.decrement();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
