import 'package:flutter/material.dart';
import 'package:time_focus/widgets/job_dialog.dart';
import '../workchain.dart';
import '../pages/workchain_page.dart';

// ignore: must_be_immutable
class JobsListView extends StatefulWidget {
  JobsListView(this.jobs, {Key? key}) : super(key: key);
  List<Job> jobs;
  @override
  State<JobsListView> createState() => _JobsListViewState();
}

class _JobsListViewState extends State<JobsListView> {
  //List<Job> jobs = [Job(), Job(), Job(), Job()];

  @override
  void initState() {
    widget.jobs[0].type = JobType.study;
    widget.jobs[0].time = 30;
    widget.jobs[0].description = "Study for exam";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.jobs.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
              leading: Icon(widget.jobs[index].getIcon()),
              title: Text("${widget.jobs[index].time} minutes"),
              subtitle: Text(widget.jobs[index].description),
              onTap: () async {
                var dialogOut = showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        JobDialog(widget.jobs[index]));
                dialogOut.then((value) {
                  setState(() {
                    widget.jobs[index] = value!;
                  });
                });
              }),
        );
      },
    );
  }
}
