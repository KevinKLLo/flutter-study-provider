import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Model/counter_model.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// 作法 2. 這種做法可以不需要 Consumer
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

            /// 作法 2. 這種做法可以不需要 Consumer
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
          /// listen: true 會報錯
          // Provider.of<CounterModel>(context, listen: false).addCount();

          /// 作法 2. read 是封裝 Provider.of 的用法
          var counterModel = context.read<CounterModel>();
          counterModel.addCount();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
