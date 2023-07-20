class Event {
  String title;
  DateTime time;
  String location;
  int grade;
  String section;

  Event({
    required this.title,
    required this.time,
    required this.location,
    required this.grade,
    required this.section,
  });
}

List<Event> sampleEvents = [
  Event(
    title: 'Yoga',
    time: DateTime(2023, 7, 20, 10, 00),
    location: 'Room 101',
    grade: 10,
    section: 'A',
  ),
  Event(
    title: 'Personal Trainings',
    time: DateTime(2023, 7, 20, 12, 00),
    location: 'Room 111',
    grade: 8,
    section: 'B',
  ),
  Event(
    title: 'Boxing',
    time: DateTime(2023, 7, 20, 16, 00),
    location: 'Room 121',
    grade: 9,
    section: 'C',
  ),
  Event(
    title: 'Zumba',
    time: DateTime(2023, 7, 20, 8, 00),
    location: 'Room 131',
    grade: 11,
    section: 'D',
  ),
];
