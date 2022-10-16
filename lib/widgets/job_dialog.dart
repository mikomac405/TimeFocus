// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import '../workchain.dart';

class JobDialog extends StatefulWidget {
  const JobDialog(this.job, {Key? key}) : super(key: key);
  final Job job;

  @override
  State<JobDialog> createState() =>
      _JobDialogState(job.description, job.time, job.type);
}

class _JobDialogState extends State<JobDialog> {
  String description;
  int minutes;
  JobType jobType;

  _JobDialogState(this.description, this.minutes, this.jobType);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return AlertDialog(
      scrollable: true,
      title: const Center(
        child: Text("Edit job"),
      ),
      content: ListView(children: [
        Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter job description',
                  ),
                  initialValue: description,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      description = value;
                    });
                  },
                ),
                Container(padding: EdgeInsets.only(top: 20)),
                SpinBox(
                  value: minutes.toDouble(),
                  decoration: const InputDecoration(labelText: 'Time'),
                  onChanged: (value) {
                    setState(() {
                      minutes = value.toInt();
                    });
                  },
                ),
                Container(padding: EdgeInsets.only(top: 20)),
                ListTile(
                  title: const Text('Brake'),
                  leading: Radio<JobType>(
                    value: JobType.brake,
                    groupValue: jobType,
                    onChanged: (JobType? value) {
                      setState(() {
                        jobType = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Study'),
                  leading: Radio<JobType>(
                    value: JobType.study,
                    groupValue: jobType,
                    onChanged: (JobType? value) {
                      setState(() {
                        jobType = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Work'),
                  leading: Radio<JobType>(
                    value: JobType.work,
                    groupValue: jobType,
                    onChanged: (JobType? value) {
                      setState(() {
                        jobType = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Lunch'),
                  leading: Radio<JobType>(
                    value: JobType.lunch,
                    groupValue: jobType,
                    onChanged: (JobType? value) {
                      setState(() {
                        jobType = value!;
                      });
                    },
                  ),
                ),
              ],
            ))
      ]),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            // Validate returns true if the form is valid, or false otherwise.
            if (formKey.currentState!.validate()) {
              Navigator.pop(
                context,
                Job(type: jobType, time: minutes, description: description),
              ); //, widget.job
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
