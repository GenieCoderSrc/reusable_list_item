import 'package:app_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

class ImageWithTitleCard extends StatelessWidget {
  const ImageWithTitleCard({
    super.key,
    required this.title,
    this.imageSource,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.titleColor,
    this.backgroundColor,
    this.onTap,
    this.radius = 50.0,
    this.isCircleAvatar = true,
    this.titleStyle,
    this.padding = const EdgeInsets.all(8.0),
    this.cardElevation = 3,
    this.borderRadius = 15.0,
    this.borderColor = const Color(0xFFE0E0E0),
  });

  /// Title displayed below the avatar.
  final String title;

  /// Image source path or URL.
  final String? imageSource;

  /// Fallback icon if image is not found.
  final IconData? icon;

  /// Color for the fallback icon.
  final Color? iconColor;
  final double? iconSize;

  /// Color of the title text.
  final Color? titleColor;

  /// Optional callback when the card is tapped.
  final VoidCallback? onTap;

  /// Background color of the card.
  final Color? backgroundColor;

  /// Radius for the avatar.
  final double radius;

  /// Whether to display a circle or rectangular avatar.
  final bool isCircleAvatar;

  /// Optional custom title text style.
  final TextStyle? titleStyle;

  /// Padding around the avatar and title.
  final EdgeInsetsGeometry padding;

  /// Elevation of the card.
  final double cardElevation;

  /// Border radius of the card.
  final double borderRadius;

  /// Border color of the card.
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: cardElevation,
        margin: const EdgeInsets.all(5),
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor, width: 1),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          splashColor: Theme.of(context).primaryColor.withAlpha(30),
          onTap: onTap,
          child: Center(
            child: Padding(
              padding: padding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8.0,
                children: <Widget>[
                  imageSource != null
                      ? AppAvatar(
                        imageSource: imageSource,
                        radius: radius,
                        isCircle: isCircleAvatar,
                        placeholderIcon: icon,
                        // iconColor: iconColor,
                      )
                      : Icon(icon, size: iconSize ?? 30, color: iconColor),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style:
                        titleStyle ??
                        AppTextStyles.subtitleSmallBold.copyWith(
                          color: titleColor,
                        ),
                    // AppTxtStyles.kSmallSubTitleBoldTextStyle.copyWith(
                    //   color: titleColor,
                    // ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
