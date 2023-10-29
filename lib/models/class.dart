class Class {
  String subject;
  String teacher;
  int grade;
  String section;
  int room;
  Day day;
  DateTime time;

  Class({
    required this.subject,
    required this.teacher,
    required this.grade,
    required this.section,
    required this.room,
    required this.day,
    required this.time
  });
}

enum Day {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
}

String dayToString(Day day) {
  switch (day) {
    case Day.monday:
      return 'Monday';
    case Day.tuesday:
      return 'Tuesday';
    case Day.wednesday:
      return 'Wednesday';
    case Day.thursday:
      return 'Thursday';
    case Day.friday:
      return 'Friday';
  }
}

List<Class> sampleClasses = [
  Class(
    subject: 'Mathematics',
    teacher: 'Mr. John Doe',
    grade: 10,
    section: 'A',
    room: 101,
    day: Day.monday,
    time: DateTime(2021, 10, 10, 10, 10)
  ),
  Class(
    subject: 'Science',
    teacher: 'Mr. John Doe',
    grade: 10,
    section: 'B',
    room: 121,
    day: Day.tuesday,
    time: DateTime(2021, 10, 10, 12, 30)
  ),
  Class(
    subject: 'English',
    teacher: 'Mr. John Doe',
    grade: 10,
    section: 'C',
    room: 102,
    day: Day.wednesday,
    time: DateTime(2021, 10, 10, 14, 30)
  ),
  Class(
    subject: 'Social Studies',
    teacher: 'Mr. John Doe',
    grade: 10,
    section: 'D',
    room: 103,
    day: Day.thursday,
    time: DateTime(2021, 10, 10, 16, 30)
  ),
  Class(
    subject: 'Computer Science',
    teacher: 'Mr. John Doe',
    grade: 10,
    section: 'E',
    room: 104,
    day: Day.friday,
    time: DateTime(2021, 10, 10, 18, 30)
  ),
];