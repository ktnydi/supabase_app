import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:supabase_app/screens/home/home_notifier.dart';
import 'package:supabase_app/screens/home/home_state.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<HomeNotifier, HomeState>(
      create: (_) => HomeNotifier(),
      builder: (context, child) {
        final homeNotifier = context.read<HomeNotifier>();
        final homeState = context.watch<HomeState>();

        return Scaffold(
          appBar: AppBar(
            title: Text('Flutter Demo Home Page'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${homeState.counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: homeNotifier.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
