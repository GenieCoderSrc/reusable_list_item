# reusable_list_item

A simple and reusable Flutter widget package for building customizable, swipeable, and elegant list UIs using the `flutter_slidable` package. Includes utilities like `AppSliderWidget`, `AppListTitle`, `ImageWithTitleCard`, and `InfoCard` for consistent and composable design.



## ✨ Features

* Add swipeable actions to any widget with `AppSliderWidget`
* Display title and subtitle using `AppListTitle`
* Use `ImageWithTitleCard` for image/avatar-based grid or card UIs
* `InfoCard` for quick dashboard summaries or profile/settings views
* Easily integrate into lists or dashboards
* Theme-aware and layout-flexible

---

## 🚀 Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  reusable_list_item: <latest_version>
```

Then run:

```bash
flutter pub get
```



## 📦 Widgets

### ✅ `AppSliderWidget`

Wraps any child widget and adds optional start and end swipe actions.

```dart
AppSliderWidget(
  child: AppListTitle(
    title: 'Swipe me!',
    subtitle: 'Left or right',
    trailing: Icon(Icons.chevron_right),
  ),
  startActions: [
    SlidableAction(
      onPressed: (_) {},
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      icon: Icons.edit,
      label: 'Edit',
    ),
  ],
  endActions: [
    SlidableAction(
      onPressed: (_) {},
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      icon: Icons.delete,
      label: 'Delete',
    ),
  ],
)
```

### ✅ `AppListTitle`

Custom title and subtitle row widget with trailing widget and border control.

```dart
AppListTitle(
  title: 'Profile',
  subtitle: 'Update your info',
  trailing: Icon(Icons.arrow_forward_ios),
  onPressed: () {},
)
```

### ✅ `ImageWithTitleCard`

Display an avatar (circle or rectangle) with a title, ideal for grid-based UIs.

```dart
ImageWithTitleCard(
  title: 'Camera',
  imageSource: 'assets/icons/camera.png',
  isCircleAvatar: true,
  onTap: () {},
)
```

### ✅ `InfoCard`

Simple card UI that uses `AppListTitle` internally, ideal for dashboard views or quick actions.

```dart
InfoCard(
  title: 'Privacy Policy',
  subtitle: 'Updated Jul 2025',
  icon: Icons.privacy_tip,
  onTap: () => print('Tapped Privacy Policy'),
)
```



## 🧰 Constructor Parameters

### `AppSliderWidget`

| Parameter         | Type                    | Description                           |
| ----------------- | ----------------------- | ------------------------------------- |
| `child`           | `Widget`                | Main child widget                     |
| `startActions`    | `List<SlidableAction>?` | Actions shown when sliding from start |
| `endActions`      | `List<SlidableAction>?` | Actions shown when sliding from end   |
| `startPaneMotion` | `Widget?`               | Optional custom motion for start      |
| `endPaneMotion`   | `Widget?`               | Optional custom motion for end        |

### `AppListTitle`

| Parameter           | Type            | Description                            |
| ------------------- | --------------- | -------------------------------------- |
| `title`             | `String?`       | Title text                             |
| `subtitle`          | `String?`       | Subtitle text (optional)               |
| `trailing`          | `Widget?`       | Widget displayed at the end (optional) |
| `onPressed`         | `VoidCallback?` | Tap handler                            |
| `border`            | `bool`          | Show bottom border (default: true)     |
| `titleTextStyle`    | `TextStyle?`    | Custom title style                     |
| `subtitleTextStyle` | `TextStyle?`    | Custom subtitle style                  |

---

## 📸 Example Screens

Use the provided examples in `example/lib` to see how each widget fits into your app's design system.



## 🔗 Dependencies

* [flutter_slidable](https://pub.dev/packages/flutter_slidable)



## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.



## 👨‍💼 Author

**reusable_list_item**
Developed with ❤️ by [Shohidul Islam](https://github.com/ShohidulProgrammer)

Contributions, issues, and pull requests are welcome!
