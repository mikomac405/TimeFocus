import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/job_dialog.dart';
import '../widgets/jobs_list_view.dart';
import '../workchain.dart';

class WorkchainPage extends StatefulWidget {
  const WorkchainPage({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<WorkchainPage> createState() => _WorkchainPageState();
}

class _WorkchainPageState extends State<WorkchainPage> {
  List<Job> jobs = [Job()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Workchain")),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: JobsListView(jobs),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Mmee"),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Job? val = await showDialog(
              context: context,
              builder: (BuildContext context) => JobDialog(Job()));
          setState(() {
            jobs.add(val!);
          });
        },
        tooltip: 'Add new job',
        child: const Icon(Icons.add),
      ),
    );
  }
}
