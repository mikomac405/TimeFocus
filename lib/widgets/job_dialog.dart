import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import '../workchain.dart';

class JobDialog extends StatefulWidget {
  const JobDialog(this.job, {Key? key}) : super(key: key);
  final Job job;
  @override
  State<JobDialog> createState() => _JobDialogState(job);
}

class _JobDialogState extends State<JobDialog> {
  _JobDialogState(this.job);
  Job job;

  final List<JobType> jobTypeList = [
    JobType.brake,
    JobType.lunch,
    JobType.study,
    JobType.work
  ];

  @override
  Widget build(BuildContext context) {
    //JobType dropdownValue = job.type;
    return AlertDialog(
      title: const Center(
        child: Text("Edit job"),
      ),
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter job name',
            ),
          ),
          Container(padding: EdgeInsets.only(top: 20)),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter job description',
            ),
          ),
          Container(padding: EdgeInsets.only(top: 20)),
          SpinBox(
            value: 10,
            decoration: const InputDecoration(labelText: 'Time'),
          ),
          Container(padding: EdgeInsets.only(top: 20)),
          DropdownButton<JobType>(
            isExpanded: true,
            value: job.type,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            underline: Container(
              height: 2,
              color: Colors.red,
            ),
            onChanged: (JobType? value) {
              setState(() {
                job.type = value!;
              });
            },
            items: jobTypeList.map<DropdownMenuItem<JobType>>((JobType value) {
              return DropdownMenuItem<JobType>(
                  value: value, child: Text(value.toEnumString()));
            }).toList(),
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () => Navigator.pop(context, job),
          child: const Text('Save'),
        ),
      ],
    );
  }
}
