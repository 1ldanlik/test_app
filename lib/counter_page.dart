import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/counter/counter_bloc.dart';

import 'bloc/theme/theme_bloc.dart';
import 'components/counter_button.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late final CounterBloc _counterBloc;

  @override
  void initState() {
    super.initState();

    _counterBloc = CounterBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterBloc, int>(
        bloc: _counterBloc,
        builder: (context, state) {
          final themeBloc = context.read<ThemeBloc>();

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CounterButton(
                      icon: const Icon(Icons.remove, color: Colors.white),
                      onPressed: () => _onDecrement(),
                    ),
                    Text('$state'),
                    CounterButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () => _onIncrement(),
                    ),
                  ],
                ),
                BlocBuilder<ThemeBloc, ThemeMode>(
                  bloc: themeBloc,
                  builder: (context, state) {
                    return Switch(
                        value: state == ThemeMode.dark,
                        onChanged: (value) =>
                            themeBloc.add(const ThemeEvent.changeTheme()));
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _onIncrement() => _counterBloc.add(const CounterEvent.increment());

  void _onDecrement() => _counterBloc.add(const CounterEvent.decrement());
}
