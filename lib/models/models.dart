class Reja {
  int id;
  String title;
  String date;
  bool completed;

  Reja({
    required this.id,
    required this.title,
    required this.date,
    this.completed = false,
  });
}
