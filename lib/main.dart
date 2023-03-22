import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbloc/counter/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("TestBloc"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: [
              Center(
                child: BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return Text('${state.count}', style: TextStyle(
                      fontSize: 25,
                    ),);
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(Increment());
                  // handle plus button press
                },
                child: Icon(Icons.add),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(Decrement());

                  // handle minus button press
                },
                child: Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
