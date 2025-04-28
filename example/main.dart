import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:reusable_list_item/reusable_list_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reusable List Item Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListExampleScreen(),
    );
  }
}

class ListExampleScreen extends StatelessWidget {
  const ListExampleScreen({super.key});

  void _onEdit(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit action clicked')),
    );
  }

  void _onDelete(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Delete action clicked')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reusable List Item Example'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GenericSliderWidget(
            child: ListTile(
              title: Text('Item #$index'),
              subtitle: const Text('Swipe left or right'),
            ),
            startActions: [
              SlidableAction(
                onPressed: (context) => _onEdit(context),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
            endActions: [
              SlidableAction(
                onPressed: (context) => _onDelete(context),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          );
        },
      ),
    );
  }
}
