import 'package:flutter/material.dart';
import 'package:time_focus/widgets/job_dialog.dart';
import '../workchain.dart';
import '../pages/workchain_page.dart';

class JobsListView extends StatefulWidget {
  const JobsListView({Key? key}) : super(key: key);

  @override
  State<JobsListView> createState() => _JobsListViewState();
}

class _JobsListViewState extends State<JobsListView> {
  List<Job> jobs = [Job(), Job(), Job(), Job()];

  @override
  void initState() {
    jobs[0].type = JobType.study;
    jobs[0].time = 30;
    jobs[0].description = "Study for exam";

    jobs[1].type = JobType.brake;
    jobs[1].time = 15;
    jobs[1].description = "Go for a short walk";

    jobs[2].type = JobType.work;
    jobs[2].time = 45;
    jobs[2].description = "Estimate new user story";

    jobs[3].type = JobType.lunch;
    jobs[3].time = 30;
    jobs[3].description = "Get some sushi";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
              leading: Icon(jobs[index].getIcon()),
              title: Text("${jobs[index].time} minutes"),
              subtitle: Text(jobs[index].description),
              onTap: () async {
                Job? val = await showDialog(
                    context: context,
                    builder: (BuildContext context) => JobDialog(jobs[index]));
                setState(() {
                  jobs[index] = val!;
                });
              }),
        );
      },
    );
  }
}
