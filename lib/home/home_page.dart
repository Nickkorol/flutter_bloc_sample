import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/app/bloc/app_bloc.dart';
import 'package:flutter_bloc_sample/home/cubit/home_bloc.dart';
import 'package:flutter_bloc_sample/repository/repository.dart';
import 'package:flutter_bloc_sample/theme/theme.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static Route route(RouteSettings settings) {
    return MaterialPageRoute<void>(
        builder: (_) => Builder(builder: (context) {
              final repository = context.read<Repository>();

              return BlocProvider(
                create: (_) => HomeCubit(
                    repository: repository, appBloc: context.read<AppBloc>()),
                child: const MyHomePage(),
              );
            }),
        settings: settings);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AppBloc, AppState>(builder: (context, appState) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Title"),
          actions: [
            IconButton(
              icon: Icon(
                appState.theme.name == "light"
                    ? Icons.nightlight_round
                    : Icons.wb_sunny_rounded,
                color: theme.colors.black,
              ),
              onPressed: () {
                context.read<HomeCubit>().changeTheme(
                    appState.theme.name == "light"
                        ? MyAppTheme.dark
                        : MyAppTheme.light);
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${appState.counterValue}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton:
            BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                backgroundColor: theme.colors.black,
                onPressed: context.read<HomeCubit>().incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                height: 16,
              ),
              FloatingActionButton(
                backgroundColor: theme.colors.black,
                onPressed: context.read<HomeCubit>().decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ],
          );
        }),
      );
    });
  }
}
