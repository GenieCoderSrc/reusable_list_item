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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ListExampleScreen(),
    );
  }
}

class ListExampleScreen extends StatelessWidget {
  const ListExampleScreen({super.key});

  void _onEdit(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Edit action clicked')));
  }

  void _onDelete(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Delete action clicked')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reusable List Item Example')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return AppSliderWidget(
            startActions: [
              SlidableAction(
                onPressed: (_) => _onEdit(context),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
            endActions: [
              SlidableAction(
                onPressed: (_) => _onDelete(context),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
            child: AppListTitle(
              title: 'Item #$index',
              subtitle: 'Swipe left or right',
              trailing: const Icon(Icons.chevron_right),
              onPressed: () => _onEdit(context),
            ),
          );
        },
      ),
    );
  }
}

class ImageWithTitleGridDemo extends StatelessWidget {
  const ImageWithTitleGridDemo({super.key});

  final List<_ItemData> _items = const [
    _ItemData(title: 'Camera', image: 'assets/icons/camera.png'),
    _ItemData(title: 'Gallery', image: 'assets/icons/gallery.png'),
    _ItemData(title: 'Music', image: 'assets/icons/music.png'),
    _ItemData(title: 'Documents', image: 'assets/icons/documents.png'),
    _ItemData(title: 'Settings', image: 'assets/icons/settings.png'),
    _ItemData(title: 'Profile', image: 'assets/icons/profile.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ImageWithTitleCard Grid Demo')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: _items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final item = _items[index];
            return ImageWithTitleCard(
              title: item.title,
              imageSource: item.image,
              radius: 48,
              isCircleAvatar: true,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped on ${item.title}')),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _ItemData {
  final String title;
  final String image;

  const _ItemData({required this.title, required this.image});
}
