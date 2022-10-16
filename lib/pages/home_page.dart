import 'package:flutter/material.dart';
import '../workchain.dart';
import '../widgets/workchain_list_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: WorkChainsListView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("new workchain");

          //Navigator.push(
          //  context,
          //  MaterialPageRoute(builder: (context) => const SecondRoute()),
          //);
        },
        tooltip: 'Add new workchain',
        child: const Icon(Icons.add),
      ),
    );
  }
}
