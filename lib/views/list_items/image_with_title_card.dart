import 'package:flutter/material.dart';
import 'package:app_style/app_style.dart';
import 'package:reusable_image_widget/app_circle_avatar.dart';

class ImageWithTitleCard extends StatelessWidget {
  const ImageWithTitleCard({
    super.key,
    this.title,
    this.imageSource,
    this.titleColor,
    this.icon = Icons.man,
    this.iconColor,
    this.backgroundColor,
    this.onTap,
    this.radius = 50,
  });

  final String? title;
  final String? imageSource;
  final Color? titleColor;
  final IconData? icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    // final TextStyle textStyle = Theme.of(context).textTheme.display1;
    // bool darkMode = false;

    debugPrint('ImageWithTitleCard | build | imageSource: $imageSource');

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        semanticContainer: true,
        elevation: 3,
        margin: const EdgeInsets.all(5),
        color: backgroundColor,
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.blueGrey.shade50, width: 1),
        ),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: onTap,
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: imageSource != null
                      ? AppCircleAvatar(
                          imageSource: imageSource,
                          radius: radius,
                        )
                      : Icon(icon, color: iconColor, size: 30),
                  // Icon(icon, color: iconColor, size: 30),
                ),
                Text(
                  title ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: AppTxtStyles.kSmallSubTitleBoldTextStyle
                      .copyWith(color: titleColor),
                ),
                // Expanded(
                //   flex: 2,
                //   child: Padding(
                //     padding: const EdgeInsets.all(10.0),
                //     child: imgUrl != null
                //         ? AppCircleAvatar(imgUrl: imgUrl)
                //         : Icon(icon, color: iconColor, size: 30),
                //   ),
                // ),
                // Expanded(
                //   flex: 1,
                //   child: Text(
                //     title ?? '',
                //     style: AppTxtStyles.kSubTitleBoldTextStyle
                //         .copyWith(color: titleColor),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
