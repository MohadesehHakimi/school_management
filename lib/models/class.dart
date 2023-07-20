class Class {
  String subject;
  String teacher;
  int grade;
  String section;
  int room;
  DateTime time;

  Class({
    required this.subject,
    required this.teacher,
    required this.grade,
    required this.section,
    required this.room,
    required this.time
  });
}

List<Class> sampleClasses = [
  Class(
    subject: 'Mathematics',
    teacher: 'Mr. John Doe',
    grade: 10,
    section: 'A',
    room: 101,
    time: DateTime(2021, 10, 10, 10, 10)
  ),
  Class(
    subject: 'Science',
    teacher: 'Mr. John Doe',
    grade: 10,
    section: 'B',
    room: 121,
    time: DateTime(2021, 10, 10, 12, 30)
  ),
  Class(
    subject: 'English',
    teacher: 'Mr. John Doe',
    grade: 10,
    section: 'C',
    room: 102,
    time: DateTime(2021, 10, 10, 14, 30)
  ),
  Class(
    subject: 'Social Studies',
    teacher: 'Mr. John Doe',
    grade: 10,
    section: 'D',
    room: 103,
    time: DateTime(2021, 10, 10, 16, 30)
  ),
];