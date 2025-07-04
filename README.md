# reusable_list_item

A simple and reusable Flutter widget for creating swipeable list items using the `flutter_slidable` package.

This widget, `GenericSliderWidget`, provides a clean and customizable way to add swipe actions (start/end) to any child widget inside a list.

## Features

- Easily add swipeable actions to list items.
- Customize start and end action panes.
- Use custom motions or the default scroll motion.
- Lightweight and easy to integrate.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  reusable_list_item: <latest_version>
```

Then run:

```bash
flutter pub get
```

## Usage

Import the package:

```dart
import 'package:reusable_list_item/reusable_list_item.dart';
```

Example:

```dart
GenericSliderWidget(
  child: ListTile(
    title: Text('Swipe me!'),
    subtitle: Text('Left or right'),
  ),
  startActions: [
    SlidableAction(
      onPressed: (context) {},
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      icon: Icons.edit,
      label: 'Edit',
    ),
  ],
  endActions: [
    SlidableAction(
      onPressed: (context) {},
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      icon: Icons.delete,
      label: 'Delete',
    ),
  ],
)
```

## Constructor Parameters

| Name            | Type                     | Description                                     |
|-----------------|---------------------------|-------------------------------------------------|
| `key`            | `Key?`                    | Widget key (optional).                          |
| `child`          | `Widget`                  | The main content inside the slidable.           |
| `startPaneMotion` | `Widget?`                 | Custom motion for start actions (optional).     |
| `endPaneMotion`   | `Widget?`                 | Custom motion for end actions (optional).       |
| `startActions`    | `List<SlidableAction>?`    | List of actions to show when sliding from start.|
| `endActions`      | `List<SlidableAction>?`    | List of actions to show when sliding from end.  |

## Dependencies

- [flutter_slidable](https://pub.dev/packages/flutter_slidable)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to contribute, raise issues, or suggest features!

## Author

[Shohidul Islam]
