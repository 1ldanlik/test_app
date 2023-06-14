import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_app/bloc/counter_bloc.dart';
import 'package:test_app/provider/theme_provider.dart';

import 'components/counter_button.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => CounterBloc(),
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            final bloc = context.read<CounterBloc>();
            final theme = Provider.of<ThemeProvider>(context);

            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CounterButton(
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          bloc.add(const CounterEvent.decrement());
                        },
                      ),
                      Text('${state.counter}'),
                      CounterButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          bloc.add(const CounterEvent.increment());
                        },
                      ),
                    ],
                  ),
                  Switch(
                      value: theme.isDark,
                      onChanged: (value) {
                        theme.changeTheme();
                      })
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
