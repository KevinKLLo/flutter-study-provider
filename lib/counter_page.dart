import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Model/counter_model.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 作法 2.
    // final counter = Provider.of<CounterModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            // 作法 2.
            // Text('${counter.count}'),
            Consumer<CounterModel>(
              builder: (context, counter, child) {
                return Text('${counter.count}');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 作法 2.
          // var counterModel = context.read<CounterModel>();
          // counterModel.addCount();
          Provider.of<CounterModel>(context, listen: false).addCount();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
