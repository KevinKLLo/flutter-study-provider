import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Model/counter_model.dart';
import 'package:state_management/counter_page.dart';

void main() {
  runApp(
    /// 作法 2. 將 ChangeNotifierProvider 移到更 root 的 Widget，不影響結果
    // ChangeNotifierProvider(
    //   create: (context) => CounterModel(),
    //   child: const MyApp(),
    // ),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// 作法 2. 將 ChangeNotifierProvider 移到更 root 的 Widget，不影響結果
    // return const MaterialApp(
    //   home: MyHomgPage(),
    // );
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MaterialApp(home: MyHomgPage()),
    );

    /// 備注：一般會是複數 Provider
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (context) => CounterModel()),
    //   ],
    //   child: const MaterialApp(home: MyHomgPage()),
    // );
  }
}

class MyHomgPage extends StatelessWidget {
  const MyHomgPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterModel>(
              builder: (context, counter, child) {
                return Text('Total count: ${counter.count}');
              },
              // builder: (context, counter, child) => Text(
              //   'Total count: ${counter.count}'
              // ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Provider.of<CounterModel>(context, listen: false).resetCount();
              },
              child: const Text(
                'Reset count',
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            // 錯誤做法：會建立一個新的 CounterModel，兩個 CounterModel 之間不會互通
            // MaterialPageRoute(
            //   builder: (context) => ChangeNotifierProvider(
            //       create: (context) => CounterModel(),
            //       child: const CounterPage(title: 'Flutter Demo Home Page')),
            // ),
            MaterialPageRoute(
              builder: (context) => const CounterPage(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
