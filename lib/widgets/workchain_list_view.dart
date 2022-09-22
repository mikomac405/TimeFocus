import 'package:flutter/material.dart';
import '../workchain.dart';
import '../pages/workchain_page.dart';

class WorkChainsListView extends StatefulWidget {
  const WorkChainsListView({Key? key}) : super(key: key);

  @override
  State<WorkChainsListView> createState() => _WorkChainsListViewState();
}

class _WorkChainsListViewState extends State<WorkChainsListView> {
  List<Workchain> workchains = [Workchain()];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: workchains.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(workchains[index].name),
            subtitle: Text(workchains[index].description),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WorkchainPage())),
          ),
        );
      },
    );
  }
}
