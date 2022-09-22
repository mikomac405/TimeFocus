import 'package:flutter/material.dart';

class Workchain {
  List<Job> jobs = [];
  int completionCounter = 0;
  String name = "Workchain";
  String description = "Default";
}

class Job {
  JobType type = JobType.brake;
  int time = 10;
  String description = "Default";

  IconData getIcon() {
    switch (type) {
      case JobType.brake:
        return Icons.motion_photos_pause;
      case JobType.study:
        return Icons.menu_book;
      case JobType.work:
        return Icons.work;
      case JobType.lunch:
        return Icons.restaurant;
    }
  }
}

enum JobType { brake, study, work, lunch }

enum Priority { unimportant, standard, important }

extension ParseToString on Enum {
  String toEnumString() {
    String result = toString().split('.').last;
    return result[0].toUpperCase() + result.substring(1);
  }
}
