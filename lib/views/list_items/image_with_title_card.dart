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
    this.onTap,
    this.backgroundColor,
    this.radius = 50.0,
    this.isCircleAvatar = true,
    this.titleStyle,
    this.padding = const EdgeInsets.all(8.0),
    this.cardElevation = 3.0,
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

  /// Size for the fallback icon.
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
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: cardElevation,
        margin: const EdgeInsets.all(5),
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          splashColor: theme.primaryColor.withAlpha(30),
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                imageSource != null
                    ? AppAvatar(
                      imageSource: imageSource,
                      radius: radius,
                      isCircle: isCircleAvatar,
                      placeholderIcon: icon,
                    )
                    : Icon(
                      icon ?? Icons.image,
                      size: iconSize ?? 30,
                      color: iconColor ?? theme.iconTheme.color,
                    ),
                const SizedBox(height: 8),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style:
                      titleStyle ??
                      theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: titleColor ?? theme.textTheme.bodyMedium?.color,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
