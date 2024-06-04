import 'package:flutter/material.dart';

import '../../models/models.dart';

class Eslatmalar extends StatefulWidget {
  @override
  _EslatmalarState createState() => _EslatmalarState();
}

class _EslatmalarState extends State<Eslatmalar> {
  List<Reja> eslatma = [];

  void _addReja() {
    TextEditingController titleController = TextEditingController();
    TextEditingController dateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Yangi Eslatma qo'shish"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Reja nomi'),
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Qachon bajarmoqchisiz'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Bekor qilish'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (titleController.text.isNotEmpty &&
                      dateController.text.isNotEmpty) {
                    eslatma.add(Reja(
                      id: eslatma.length + 1,
                      title: titleController.text,
                      date: dateController.text,
                      completed: false,
                    ));
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text("Qo'shish"),
            ),
          ],
        );
      },
    );
  }

  void _editReja(int index) {
    TextEditingController titleController =
    TextEditingController(text: eslatma[index].title);
    TextEditingController dateController =
    TextEditingController(text: eslatma[index].date);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Eslatmani tahrirlash'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Date (yyyy-MM-dd)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Bekor qilish'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  eslatma[index] = Reja(
                    id: eslatma[index].id,
                    title: titleController.text,
                    date: dateController.text,
                    completed: eslatma[index].completed,
                  );
                });
                Navigator.of(context).pop();
              },
              child: Text('Saqlash'),
            ),
          ],
        );
      },
    );
  }

  void _deleteReja(int index) {
    setState(() {
      eslatma.removeAt(index);
    });
  }

  void _toggleCompletion(int index) {
    setState(() {
      eslatma[index].completed = !eslatma[index].completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eslatma'),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: eslatma.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
                child: ListTile(
                  leading: Checkbox(
                    value: eslatma[index].completed,
                    onChanged: (bool? value) {
                      _toggleCompletion(index);
                    },
                  ),
                  title: Text(
                    eslatma[index].title,
                    style: TextStyle(
                      decoration: eslatma[index].completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text('${eslatma[index].date}'),
                  isThreeLine: true,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editReja(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteReja(index),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addReja,
        child: Icon(Icons.add),
      ),
    );
  }
}
