import 'package:flutter/material.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';
import 'package:reusable_list_item/domain/entity/info_entity.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.infoList,
    this.onItemTap,
    this.showDivider = true,
    this.cardElevation = 2.0,
    this.cardPadding = const EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 12.0,
    ),
    this.titleTextStyle,
    this.subtitleTextStyle,
  });

  /// List of information items to display.
  final List<InfoEntity> infoList;

  /// Optional callback when a list item is tapped.
  final void Function(InfoEntity info)? onItemTap;

  /// Whether to show a divider between list items.
  final bool showDivider;

  /// Elevation of the card.
  final double cardElevation;

  /// Padding inside the card.
  final EdgeInsets cardPadding;

  /// Optional override for title text style.
  final TextStyle? titleTextStyle;

  /// Optional override for subtitle text style.
  final TextStyle? subtitleTextStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: cardElevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: cardPadding,
        child: Column(
          children: [
            for (int i = 0; i < infoList.length; i++) ...[
              _buildInfoItem(infoList[i], theme),
              if (showDivider && i != infoList.length - 1)
                const Divider(height: 16),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(InfoEntity info, ThemeData theme) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading:
          info.imgUrl != null
              ? AppCircleAvatar(radius: 20, imageSource: info.imgUrl)
              : null,
      title: Text(
        info.title ?? '',
        style: titleTextStyle ?? theme.textTheme.titleMedium,
      ),
      subtitle:
          info.subTitle != null
              ? Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  info.subTitle!,
                  style: subtitleTextStyle ?? theme.textTheme.bodySmall,
                ),
              )
              : null,
      onTap: () => onItemTap?.call(info),
    );
  }
}
