import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/jobs_list_view.dart';

class WorkchainPage extends StatefulWidget {
  const WorkchainPage({Key? key}) : super(key: key);

  @override
  State<WorkchainPage> createState() => _WorkchainPageState();
}

class _WorkchainPageState extends State<WorkchainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Workchain")),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Expanded(
            child: JobsListView(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("new job");
        },
        tooltip: 'Add new job',
        child: const Icon(Icons.add),
      ),
    );
  }
}
